package com.meebid.front.utils;

/**
 * Created by gaoyang on 17/6/17.
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * 读取excel文件类
 *
 * @author wanghao 2016-05-13
 */
public class ExcelRead {
    //总行数
    private int totalRows = 0;
    //总条数
    private int totalCells = 0;
    //错误信息接收器
    private String errorMsg;

    //构造方法
    public ExcelRead() {
    }

    //得到总行数
    public int getTotalRows() {
        return totalRows;
    }

    //得到总列数
    public int getTotalCells() {
        return totalCells;
    }

    public String getErrorInfo() {
        return errorMsg;
    }

    /**
     * 描述：验证EXCEL文件
     *
     * @param filePath
     * @return
     */
    public boolean validateExcel(String filePath) {
        if (filePath == null || !(WDWUtil.isExcel2003(filePath) || WDWUtil.isExcel2007(filePath))) {
            errorMsg = "文件名不是excel格式";
            return false;
        }
        return true;
    }


    /**
     * 描述 :读EXCEL文件
     *
     * @param fielName
     * @return
     */
    public Workbook getExcelInfo(String fileName, MultipartFile Mfile) {

        //把spring文件上传的MultipartFile转换成File
        CommonsMultipartFile cf = (CommonsMultipartFile) Mfile;
        DiskFileItem fi = (DiskFileItem) cf.getFileItem();
        File file = fi.getStoreLocation();

        Workbook wb = null;
        InputStream is = null;
        try {
            //验证文件名是否合格
            if (!validateExcel(fileName)) {
                return null;
            }
            //判断文件时2003版本还是2007版本
            boolean isExcel2003 = true;
            if (WDWUtil.isExcel2007(fileName)) {
                isExcel2003 = false;
            }
            is = new FileInputStream(file);
            //当excel是2003时
            if (isExcel2003) {
                wb = new HSSFWorkbook(is);
            } else {
                wb = new XSSFWorkbook(is);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    is = null;
                    e.printStackTrace();
                }
            }
        }
        return wb;
    }

    /**
     * 读取Excel里面的信息
     *
     * @param wb
     * @return
     */
    public Map<String, Object> readComplainValue(Workbook wb) {
        int sheetCount = wb.getNumberOfSheets();
        Map<String, Object> mapList = new HashMap<String, Object>();
        for (int i = 0; i < sheetCount; i++) {
            //得到第i个shell
            Sheet sheet = wb.getSheetAt(i);
            String sheetName = sheet.getSheetName();
            //得到Excel的行数
            this.totalRows = sheet.getPhysicalNumberOfRows();
            //得到Excel的列数(前提是有行数)
            if (totalRows >= 1 && sheet.getRow(0) != null) {
                this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
            }
            //User user;
            //循环Excel行数,从第二行开始。标题不入库
            for (int r = 1; r < totalRows; r++) {
                Row row = sheet.getRow(r);
                if (row == null || StringUtils.isBlank(String.valueOf(getValue(row.getCell(0))))) continue;
                Map<String, String> hashmap = new HashMap<String, String>();
                hashmap.put("role", sheetName);
                //循环Excel的列
                for (int c = 0; c < this.totalCells; c++) {
                    Cell cell = row.getCell(c);
                    if (null != cell) {
                        cell.setCellType(Cell.CELL_TYPE_STRING);
                        if (c == 0) {//获得第一列 拍品编号（*）
                            hashmap.put("lot", getValue(cell));
                        } else if (c == 1) {//拍品名称（*）
                            hashmap.put("name", getValue(cell));
                        } else if (c == 2) {//拍品描述（*）
                            hashmap.put("description", getValue(cell));
                        } else if (c == 3) {//起拍价格（*）
                            hashmap.put("startingPrice", getValue(cell));
                        } else if (c == 4) {//估价下限
                            hashmap.put("estimateMin", getValue(cell));
                        } else if (c == 5) {//估价上限
                            hashmap.put("estimateMax", getValue(cell));
                        } else if (c == 6) {//保留价
                            hashmap.put("reservePrice", getValue(cell));
                        } else if (c == 7) {//类别
                            hashmap.put("category", getValue(cell));
                        }
                    }
                }
                mapList.put(i + "-" + r, hashmap);
            }
        }
        return mapList;
    }

    @SuppressWarnings("static-access")
    private String getValue(Cell hssfCell) {
        if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
            return String.valueOf(hssfCell.getBooleanCellValue());
        } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
            return String.valueOf(hssfCell.getNumericCellValue());
        } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_STRING) {
            return String.valueOf(hssfCell.getStringCellValue());
        } else {
            return String.valueOf(hssfCell.getStringCellValue());
        }
    }
}

/**
 * @描述：工具类 检验是否是EXCEL文件
 */
class WDWUtil {
    // @描述：是否是2003的excel，返回true是2003
    public static boolean isExcel2003(String filePath) {
        return filePath.matches("^.+\\.(?i)(xls)$");
    }

    //@描述：是否是2007的excel，返回true是2007
    public static boolean isExcel2007(String filePath) {
        return filePath.matches("^.+\\.(?i)(xlsx)$");
    }
}
