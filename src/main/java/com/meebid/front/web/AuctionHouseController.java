package com.meebid.front.web;

import com.meebid.front.bean.*;
import com.meebid.front.exception.ErrorException;
import com.meebid.front.service.UploadService;
import com.meebid.front.utils.*;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestOperations;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * Created by gaoyang on 16/2/28.
 */
@Controller
@RequestMapping("/auctionhouse")
public class AuctionHouseController {


    private String RESTURL = SettingUtil.getSetting("RESTURL");

    private String uid = "15800531996";

    @Autowired
    private RestOperations restOps;

    @Autowired
    private UploadService uploadService;


    /**
     * 拍卖行首页
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request,
                        HttpServletResponse response) {
        return "/auctionhouse/index";
    }

    /**
     * 创建拍卖页面
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/showcreateauction")
    public String showcreateauction(HttpServletRequest request,
                                    HttpServletResponse response) {
        return "/auctionhouse/createauction";
    }

    /**
     * 创建拍卖页面
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/showlistauctiondetail")
    public String showlistauctiondetail(HttpServletRequest request,
                                        HttpServletResponse response) {
        String auctionId = ConvertUtil.safeToString(request.getParameter("auctionId"), "");

        ResponseEntity<AuctionDetail> responseEntity = null;
        responseEntity = restOps.exchange(
                RESTURL + "auction/detail?auctionId={auctionId}",
                HttpMethod.GET,
                null,
                AuctionDetail.class, auctionId);
        request.setAttribute("detail", responseEntity.getBody());

        //拍卖会ID
        request.setAttribute("auctionId", ConvertUtil.safeToString(request.getParameter("auctionId"), ""));

        return "/auctionhouse/listauctiondetail";
    }


    /**
     * 创建拍卖页面
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/showlistauctionsetting")
    public String showlistauctionsetting(HttpServletRequest request,
                                         HttpServletResponse response) {
        //拍卖会ID
        request.setAttribute("auctionId", ConvertUtil.safeToString(request.getParameter("auctionId"), ""));
        return "/auctionhouse/listauctionsetting";
    }


    /**
     * 审核
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/listpaticipants")
    public String listpaticipants(HttpServletRequest request,
                                  HttpServletResponse response) {
        String auctionId = ConvertUtil.safeToString(request.getParameter("auctionId"), "");
        String status = ConvertUtil.safeToString(request.getParameter("status"), "");

        String page = StringUtil.safeToString(request.getParameter("page"), "1");
        String pageSize = StringUtil.safeToString(request.getParameter("pageSize"), "12");


        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("auctionId", auctionId);
        form.set("pageSize", pageSize);
        form.set("page", page);
        form.set("status", status);
        ResponseEntity<SearchTemplate<Paticipant>> res = restOps.exchange(
                RESTURL + "auction/participate-list",
                HttpMethod.POST,
                new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                new ParameterizedTypeReference<SearchTemplate<Paticipant>>() {
                });
        request.setAttribute("list", res.getBody().getDateList());
        request.setAttribute("page", PageUtil.getPage(Integer.valueOf(page), Integer.parseInt(pageSize), res.getBody().getTotalCount()));

        request.setAttribute("ALL", res.getBody().getTotalCount());
        request.setAttribute("PENDING", res.getBody().getPendingCount());
        request.setAttribute("APPORVED", res.getBody().getApprovedCount());
        request.setAttribute("REJECTED", res.getBody().getRejectedCount());
        request.setAttribute("status", status);

        request.setAttribute("a" + status, "active");


        //拍卖会ID
        request.setAttribute("auctionId", ConvertUtil.safeToString(request.getParameter("auctionId"), ""));

        return "/auctionhouse/listpaticipants";
    }


    /**
     * 创建拍卖页面
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/createauction")
    public String createauction(HttpServletRequest request,
                                HttpServletResponse response) {
        String name = request.getParameter("name");
        String exhibition = StringUtil.safeToString(request.getParameter("exhibition"), "0");
        String timezone = StringUtil.safeToString(request.getParameter("timezone"), "");
        String date1 = StringUtil.safeToString(request.getParameter("date1"), "");
        String date2 = StringUtil.safeToString(request.getParameter("date2"), "");
        String desc = StringUtil.safeToString(request.getParameter("desc"), "");
        String country = StringUtil.safeToString(request.getParameter("countryId"), "");
        String state = StringUtil.safeToString(request.getParameter("stateId"), "");
        String city = StringUtil.safeToString(request.getParameter("cityId"), "");

        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("name", name);
        form.set("country", country);
        form.set("state", state);
        form.set("city", city);
        form.set("timezone", timezone);
        form.set("desc", desc);
        form.set("start_time", DateUtil.getDateFormatByUS(date1 + " " + date2 + ":00"));
        form.set("sellerId", uid);
        form.set("status", "0");

        ResponseEntity<String> responseEntity = null;
        try {
            responseEntity = restOps.exchange(RESTURL + "auction/create",
                    HttpMethod.POST,
                    new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                    String.class);
        } catch (ErrorException e) {
            request.setAttribute("errorinfo", e.getErrorBean().getMessage());
            return "/auctionhouse/createauction";
        }
        if (responseEntity.getStatusCode() != HttpStatus.CREATED) {
            return "/auctionhouse/createauction";
        } else {
            return "redirect:/auctionhouse/listauctions";
        }
    }

    /**
     * 创建拍卖页面
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/createauctionitem")
    public String createauctionitem(HttpServletRequest request,
                                    HttpServletResponse response, @RequestParam("uploadfile") MultipartFile[] files, RedirectAttributes attr) {

        String name = ConvertUtil.safeToString(request.getParameter("name"), "");
        String description = ConvertUtil.safeToString(request.getParameter("description"), "");
        String auctionId = ConvertUtil.safeToString(request.getParameter("auctionId"), "");
        String category = ConvertUtil.safeToString(request.getParameter("category"), "");
        String lotId = ConvertUtil.safeToString(request.getParameter("lotId"), "");

        Integer lotnumber = ConvertUtil.safeToInteger(request.getParameter("lotnumber"), 0);
        Integer reservePrice = ConvertUtil.safeToInteger(request.getParameter("reservePrice"), 0);
        Integer startingPrice = ConvertUtil.safeToInteger(request.getParameter("startingPrice"), 0);
        Integer estimateMax = ConvertUtil.safeToInteger(request.getParameter("estimateMax"), 0);
        Integer estimateMin = ConvertUtil.safeToInteger(request.getParameter("estimateMin"), 0);

        List<String> imgPaths = new ArrayList<>();

        RequestAuctionItem requestAuctionItem = new RequestAuctionItem();
        requestAuctionItem.setAuctionId(auctionId);
        requestAuctionItem.setCategory(category);
        requestAuctionItem.setLotNumber(lotnumber);
        requestAuctionItem.setName(name);
        requestAuctionItem.setEstimateMax(estimateMax);
        requestAuctionItem.setEstimateMin(estimateMin);
        requestAuctionItem.setReservePrice(reservePrice);
        requestAuctionItem.setStartingPrice(startingPrice);
        requestAuctionItem.setDescription(description);
        requestAuctionItem.setLotId(lotId);

        String url = RESTURL;
        if (!"".equals(lotId)) {
            url += "auction-items/update";
        } else {
            url += "auction-items/create";
        }

        for (MultipartFile file : files) {
            try {
                String imgurl = uploadService.qiniuyunupload(file.getBytes());
                imgPaths.add(SettingUtil.getSetting("IMGURL") + imgurl);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        requestAuctionItem.setImgPaths(imgPaths);
        ResponseEntity<String> responseEntity = null;
        try {
            responseEntity = restOps.exchange(
                    url,
                    HttpMethod.POST,
                    new HttpEntity<RequestAuctionItem>(requestAuctionItem, new HttpHeaders()),
                    String.class);
        } catch (ErrorException e) {
            request.setAttribute("errorinfo", e.getErrorBean().getMessage());
            return "/auctionhouse/createauctionitem";
        }
        if (responseEntity.getStatusCode() != HttpStatus.CREATED) {
            return "/auctionhouse/createauctionitem";
        } else {
            attr.addAttribute("auctionId", ConvertUtil.safeToString(request.getParameter("auctionId"), ""));
            return "redirect:/auctionhouse/listauctionitem";
        }
    }

    /**
     * 批量上传EXL
     *
     * @param request
     * @param
     * @return
     */
    @RequestMapping(value = "/uploadauctionitem")
    public String uploadauctionitem(HttpServletRequest request, HttpServletResponse response,
                                    @RequestParam("file") CommonsMultipartFile file, RedirectAttributes attr) {
        String auctionId = ConvertUtil.safeToString(request.getParameter("auctionId"), "");
        if (!file.isEmpty()) {
            List<RequestItem> itemList = new ArrayList<>();
            //获取文件名
            String name = file.getOriginalFilename();
            //处理EXCEL
            ExcelRead readExcel = new ExcelRead();
            //获得解析excel方法
            Workbook wb = readExcel.getExcelInfo(name, file);
            Map<String, Object> mapList = readExcel.readComplainValue(wb);
            Set<String> set = mapList.keySet();
            for (Iterator<String> iter = set.iterator(); iter.hasNext(); ) {
                String key = (String) iter.next();
                @SuppressWarnings("unchecked")
                Map<String, String> listStr = (Map<String, String>) mapList.get(key);
                int source = 0;
                RequestItem requestItem = new RequestItem();
                requestItem.setLotNumber(ConvertUtil.safeToInteger(listStr.get("lot"), 0));
                requestItem.setName(ConvertUtil.safeToString(listStr.get("name"), ""));
                requestItem.setDescription(ConvertUtil.safeToString(listStr.get("description"), ""));
                requestItem.setStartingPrice(ConvertUtil.safeToInteger(listStr.get("startingPrice"), 0));
                requestItem.setEstimateMin(ConvertUtil.safeToInteger(listStr.get("estimateMin"), 0));
                requestItem.setEstimateMax(ConvertUtil.safeToInteger(listStr.get("estimateMax"), 0));
                requestItem.setReservePrice(ConvertUtil.safeToInteger(listStr.get("reservePrice"), 0));
                requestItem.setCategory(ConvertUtil.safeToString(listStr.get("category"), ""));
                requestItem.setAuctionId(auctionId);
                itemList.add(requestItem);
            }
            ResponseItem responseItem = restOps.postForObject(RESTURL + "auction-items/batchCreate", itemList, ResponseItem.class);
            System.out.println(responseItem.getSuccess());
        }


        attr.addAttribute("auctionId", ConvertUtil.safeToString(request.getParameter("auctionId"), ""));
        return "redirect:/auctionhouse/listauctionitem";
    }

    /**
     * 批量上传ZIP
     *
     * @param request
     * @param
     * @return
     */
    @RequestMapping(value = "/uploadauctionitemzip")
    public String uploadauctionitemzip(HttpServletRequest request, HttpServletResponse response,
                                       @RequestParam("file2") MultipartFile file, RedirectAttributes attr) {
        String auctionId = ConvertUtil.safeToString(request.getParameter("auctionId"), "");
        /**构建保存的目录**/
        String tmpPathDir = "/file/" + auctionId;
        String tmpRealPathDir = request.getSession().getServletContext().getRealPath(tmpPathDir);
        /**根据真实路径创建目录**/
        File tmpSaveFile = new File(tmpRealPathDir);
        if (!tmpSaveFile.exists())
            tmpSaveFile.mkdirs();
        String fileuuid = UUID.randomUUID().toString();
        String fileName = tmpRealPathDir + File.separator + fileuuid;

        File transferred = new File(fileName);
        try {
            file.transferTo(transferred);
            //解压缩文件
            ZipUtil.unzip(fileName);
            String[] fname = ZipUtil.getFileName(tmpRealPathDir);
            Map<Integer, Set<Integer>> imgmap = new HashMap(); //用来存整理后的图片
            for (String f : fname) {
                if (-1 != f.indexOf("-")) {
                    String[] f1 = f.split("-");
                    if (2 == f1.length) {
                        if (ConvertUtil.isNumeric(f1[0]) && ConvertUtil.isNumeric(f1[1])) {
                            Integer lotnum = ConvertUtil.safeToInteger(f1[0], 0);
                            Integer imgnum = ConvertUtil.safeToInteger(f1[1], 0);
                            Set<Integer> tmp = new HashSet<>();
                            if (imgmap.containsKey(lotnum)) {
                                tmp = imgmap.get(lotnum);
                            }
                            tmp.add(imgnum);
                            imgmap.put(lotnum, tmp);
                        }
                    }
                }
            }
            List<RequestItemImg> itemList = new ArrayList<>();
            for (Map.Entry<Integer, Set<Integer>> entry : imgmap.entrySet()) {
                RequestItemImg itemimg = new RequestItemImg();
                itemimg.setAuctionId(auctionId);
                itemimg.setLotNumber(ConvertUtil.safeToString(entry.getKey(), ""));
                List<String> imglist = new ArrayList<>();
                for (Integer i:entry.getValue()) {
                    String filepath=tmpRealPathDir+ File.separator+entry.getKey()+"-"+i;
                    try {
                        String imgurl = uploadService.qiniuyunupload(IOUtil.getBytes(filepath));
                        imglist.add(SettingUtil.getSetting("IMGURL") + imgurl);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                itemimg.setImages(imglist);
                itemList.add(itemimg);
            }
            ResponseItem responseItem = restOps.postForObject(RESTURL + "auction-items/imagesBatchCreate", itemList, ResponseItem.class);
            System.out.println(responseItem.getSuccess());

        } catch (IOException e) {
            e.printStackTrace();
        }


        attr.addAttribute("auctionId", ConvertUtil.safeToString(request.getParameter("auctionId"), ""));
        return "redirect:/auctionhouse/listauctionitem";
    }


    /**
     * 拍品列表页面
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/listauctionitem")
    public String listauctionitem(HttpServletRequest request,
                                  HttpServletResponse response) {

        String auctionId = ConvertUtil.safeToString(request.getParameter("auctionId"), "");

        System.out.println("auctionId---" + auctionId);

        String page = StringUtil.safeToString(request.getParameter("page"), "1");
        String pageSize = StringUtil.safeToString(request.getParameter("pageSize"), "10");
        String itemNumOrder = StringUtil.safeToString(request.getParameter("itemNumOrder"), "");
        String priceOrder = StringUtil.safeToString(request.getParameter("priceOrder"), "");
        String popularOrder = StringUtil.safeToString(request.getParameter("pageSize"), "");


        MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
        form.set("auctionId", auctionId);
        form.set("pageSize", Integer.parseInt(pageSize));
        form.set("page", Integer.parseInt(page));
//        form.set("itemNumOrder", itemNumOrder);
//        form.set("priceOrder", priceOrder);
//        form.set("popularOrder", popularOrder);
        ResponseEntity<SearchTemplate<Item>> res = restOps.exchange(
                RESTURL + "auction-items/items-list?auctionId={auctionId}&pageSize={pageSize}&page={page}",
                HttpMethod.GET, null,
                new ParameterizedTypeReference<SearchTemplate<Item>>() {
                }, auctionId, pageSize, page);
        request.setAttribute("list", res.getBody().getDateList());
        request.setAttribute("page", PageUtil.getPage(Integer.valueOf(page), Integer.parseInt(pageSize), res.getBody().getTotalCount()));

        //拍卖会ID
        request.setAttribute("auctionId", ConvertUtil.safeToString(request.getParameter("auctionId"), ""));
        return "/auctionhouse/listauctionitem";
    }

    /**
     * 创建拍卖商品添加
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/showcreateauctionitem")
    public String showcreateauctionitem(HttpServletRequest request,
                                        HttpServletResponse response) {
        String lotId = StringUtil.safeToString(request.getParameter("lotId"), "");
        String auctionId = StringUtil.safeToString(request.getParameter("auctionId"), "");

        ResponseEntity<RequestAuctionItem> responseEntity = null;
        responseEntity = restOps.exchange(
                RESTURL + "auction-items/item-detail?lotId={lotId}&auctionId={auctionId}",
                HttpMethod.GET,
                null,
                RequestAuctionItem.class, lotId, auctionId);
        request.setAttribute("item", responseEntity.getBody());
        //拍卖会ID
        request.setAttribute("auctionId", ConvertUtil.safeToString(request.getParameter("auctionId"), ""));
        request.setAttribute("lotId", lotId);
        return "/auctionhouse/createauctionitem";
    }


    /**
     * 拍卖会列表页面
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/listauctions")
    public String listauction(HttpServletRequest request,
                              HttpServletResponse response) {
        int page = ConvertUtil.safeToInteger(request.getParameter("page"), 1);
        int pageSize = ConvertUtil.safeToInteger(request.getParameter("pageSize"), 10);
        String status = StringUtil.safeToString(request.getParameter("status"), "");


        MultiValueMap<String, Object> form = new LinkedMultiValueMap<String, Object>();
        form.set("sellerId", uid);
        form.set("pageSize", "" + pageSize);
        form.set("page", "" + page);
        form.set("status", status);


        ResponseEntity<SearchTemplate<Auctions>> res = restOps.exchange(
                RESTURL + "auction/seller-auction-list",
                HttpMethod.POST,
                new HttpEntity<MultiValueMap<String, Object>>(form, new HttpHeaders()),
                new ParameterizedTypeReference<SearchTemplate<Auctions>>() {
                });

        request.setAttribute("auctionses", res.getBody().getDateList());
        request.setAttribute("page", PageUtil.getPage(page, pageSize, res.getBody().getTotalCount()));

        request.setAttribute("a" + status, "active");
        request.setAttribute("status", status);

        return "/auctionhouse/listauctions";
    }

    /**
     * 拍卖会信息显示
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/auctioninfo")
    public String auctioninfo(HttpServletRequest request,
                              HttpServletResponse response) {
        return "/auctionhouse/auctioninfo";
    }

    /**
     * 拍卖会列表页面
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/listmessage")
    public String listmessage(HttpServletRequest request,
                              HttpServletResponse response) {
        String page = StringUtil.safeToString(request.getParameter("page"), "1");
        String pageSize = StringUtil.safeToString(request.getParameter("pageSize"), "10");


        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("uid", uid);
        form.set("pageSize", pageSize);
        form.set("page", page);
        ResponseEntity<SearchTemplate<Message>> res = restOps.exchange(
                RESTURL + "message/list",
                HttpMethod.POST,
                new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                new ParameterizedTypeReference<SearchTemplate<Message>>() {
                });
        request.setAttribute("listmessage", res.getBody().getDateList());
        request.setAttribute("page", PageUtil.getPage(Integer.valueOf(page), Integer.parseInt(pageSize), res.getBody().getTotalCount()));
        return "/auctionhouse/listmessage";
    }

    @RequestMapping(value = "/addmessage", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public Object addmessage(HttpServletRequest request, HttpServletResponse response) {
        String subject = StringUtil.safeToString(request.getParameter("subject"), "");
        String content = StringUtil.safeToString(request.getParameter("content"), "");
        String recipients = StringUtil.safeToString(request.getParameter("recipients"), "");

        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("subject", subject);
        form.set("content", content);
        form.set("recipients", recipients);
        form.set("correspondent", "15800531997");
        form.set("attachment", "");

        ResponseEntity<String> responseEntity = null;
        try {
            responseEntity = restOps.exchange(
                    RESTURL + "message/create",
                    HttpMethod.POST,
                    new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                    String.class);
        } catch (ErrorException e) {
            request.setAttribute("errorinfo", e.getErrorBean().getMessage());
            return "/auctionhouse/listmessage";
        }
        return "redirect:/auctionhouse/listmessage";
    }


    @RequestMapping(value = "/updateMessageState", method = RequestMethod.POST)
    @ResponseBody
    public Object updateMessageState(HttpServletRequest request, HttpServletResponse response) {
        String messageId = StringUtil.safeToString(request.getParameter("messageId"), "");
        String state = StringUtil.safeToString(request.getParameter("state"), "1");


        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("messageId", messageId);
        form.set("state", state);

        ResponseEntity<String> responseEntity = null;
        try {
            responseEntity = restOps.exchange(
                    RESTURL + "message/updateMessageState",
                    HttpMethod.POST,
                    new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                    String.class);
        } catch (ErrorException e) {
            return e.getErrorBean().getMessage();
        }
        return "";
    }

    @RequestMapping(value = "/updateMessageStateAll", method = RequestMethod.POST)
    @ResponseBody
    public Object updateMessageStateAll(HttpServletRequest request, HttpServletResponse response) {

        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("uid", uid);

        ResponseEntity<String> responseEntity = null;
        try {
            responseEntity = restOps.exchange(
                    RESTURL + "message/updateAllMessageToRead",
                    HttpMethod.POST,
                    new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                    String.class);
        } catch (ErrorException e) {
            return e.getErrorBean().getMessage();
        }
        return "";
    }

    @RequestMapping(value = "/updatepaticipant", method = RequestMethod.POST)
    @ResponseBody
    public Object updatepaticipant(HttpServletRequest request, HttpServletResponse response) {

        String participatesId = StringUtil.safeToString(request.getParameter("participatesId"), "");
        String status = StringUtil.safeToString(request.getParameter("status"), "");

        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();
        form.set("participatesId", participatesId);
        form.set("status", status);
        ResponseEntity<String> responseEntity = null;
        try {
            responseEntity = restOps.exchange(
                    RESTURL + "auction/participate-approve",
                    HttpMethod.POST,
                    new HttpEntity<MultiValueMap<String, String>>(form, new HttpHeaders()),
                    String.class);
        } catch (ErrorException e) {
            return e.getErrorBean().getMessage();
        }
        return "";
    }

    @RequestMapping(value = "/deleteitem", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteitem(HttpServletRequest request, HttpServletResponse response) {
        String lotId = StringUtil.safeToString(request.getParameter("lotId"), "");
        String auctionId = StringUtil.safeToString(request.getParameter("auctionId"), "");

        ResponseEntity<String> responseEntity = null;
        try {
            responseEntity = restOps.exchange(
                    RESTURL + "auction-items/delete?lotId={lotId}&auctionId={auctionId}",
                    HttpMethod.DELETE,
                    null,
                    String.class, lotId, auctionId);
        } catch (ErrorException e) {
            return e.getErrorBean().getMessage();
        }
        return "";
    }

    @RequestMapping(value = "/addExhibition", method = RequestMethod.POST)
    public Object addExhibition(HttpServletRequest request, HttpServletResponse response, RedirectAttributes attr) {
        String auctionId = StringUtil.safeToString(request.getParameter("auctionId"), "");
        String exhibitionAddress = StringUtil.safeToString(request.getParameter("exhibitionAddress"), "");
        String timezone = StringUtil.safeToString(request.getParameter("timezone2"), "");

        String[] datetime1 = request.getParameterValues("datetime1");
        String[] datetime2 = request.getParameterValues("datetime2");
        String[] datetime3 = request.getParameterValues("datetime3");

        List<ExhibitionTime> exhibitionTimeList = new ArrayList<>();

        for (int i = 0; i < datetime1.length; i++) {
            String d1 = datetime1[i];
            String d2 = datetime2[i];
            String d3 = datetime3[i];

            ExhibitionTime exhibitionTime = new ExhibitionTime();
            exhibitionTime.setExhibitionStartTime(DateUtil.getDateFormatByUS(d1 + " " + d2 + ":00"));
            exhibitionTime.setExhibitionEndTime(DateUtil.getDateFormatByUS(d1 + " " + d3 + ":00"));
            exhibitionTimeList.add(exhibitionTime);
        }


        MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
        form.set("auctionId", auctionId);
        form.set("exhibitionAddress", exhibitionAddress);
        form.set("timezone", timezone);
        form.set("exhibitionTime", exhibitionTimeList);

        Exhibition exhibition = new Exhibition();
        exhibition.setAuctionId(auctionId);
        exhibition.setExhibitionAddress(exhibitionAddress);
        exhibition.setTimezone(timezone);
        exhibition.setExhibitionTime(exhibitionTimeList);
        ResponseEntity<Exhibition> responseEntity = null;
        try {
            restOps.postForObject(RESTURL + "auction/addExhibition", exhibition, Exhibition.class);
        } catch (ErrorException e) {
            return e.getErrorBean().getMessage();
        }
        attr.addAttribute("auctionId", ConvertUtil.safeToString(request.getParameter("auctionId"), ""));
        return "redirect:/auctionhouse/showlistauctiondetail";
    }
}
