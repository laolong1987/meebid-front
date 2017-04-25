package com.meebid.front.web;

import com.meebid.front.utils.ConvertUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.UUID;

/**
 * Created by gaoyang on 16/2/28.
 */
@RestController
public class UploadFileController {


    @RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public String adduploadfile(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws IOException {
        /**构建保存的目录**/
        String tmpPathDir = "/tmp";
        String tmpRealPathDir = request.getSession().getServletContext().getRealPath(tmpPathDir);
        /**根据真实路径创建目录**/
        File tmpSaveFile = new File(tmpRealPathDir);
        if (!tmpSaveFile.exists())
            tmpSaveFile.mkdirs();
        String fileuuid = UUID.randomUUID().toString();
        String fileName = tmpRealPathDir + File.separator + fileuuid;

        File transferred = new File(fileName);
        file.transferTo(transferred);

        return "";
    }


    private String getAsciiFilename(String filename) {
        return new String(filename.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
    }

    private String getContentDispositionValue(String filename) {

        return String.format("attachment; filename=\"%s\"; filename*=UTF-8''%s",
                getAsciiFilename(filename),
                urlEncode(filename));
        //return String.format("attachment; filename=\"%s\"", getAsciiFilename(encodedFilename));
    }

    private String urlEncode(String s) {
        try {
            return URLEncoder.encode(s, "UTF-8").replaceAll("\\+", "%20");
        } catch (UnsupportedEncodingException uee) {
            throw new RuntimeException(uee);
        }
    }

//    @ExceptionHandler
//    public ResponseEntity<ErrorModel> handleBindException(BindException be) {
//        ErrorModelBuilder errorModelBuilder = new ErrorModelBuilder("000500");
//
//        for (FieldError fieldError : be.getBindingResult().getFieldErrors()) {
//            String errorCode = fieldError.getDefaultMessage();
//            if (ErrorModelBuilder.validateErrorCode(errorCode))
//                errorModelBuilder.addChildError(errorCode);
//        }
//
//        ErrorModel model = errorModelBuilder.build();
//        return new ResponseEntity<>(model, HttpStatus.valueOf(model.getStatusCode()));
//    }
}
