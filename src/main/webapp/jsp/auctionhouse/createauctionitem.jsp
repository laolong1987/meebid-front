<%--
  Created by IntelliJ IDEA.
  User: gaoyang
  Date: 17/2/12
  Time: 下午12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="include.jsp"%>
<html lang="en">
<head>
    <title>Title</title>
</head>
<body>

<!-- top start -->
<jsp:include page="top.jsp" />
<!-- top end  -->

<!-- top left -->
<jsp:include page="left.jsp" />
<!-- top left -->

<div class="auction-main">
    <div class="text-center" style="padding-top: 20px;padding-bottom: 20px">
        <H2>CREATE NEW ITEM</H2>
    </div>

    <form class="form-horizontal" id="addform" action="createauctionitem" name="addform" role="form" method="post" enctype="multipart/form-data" >
        <input name="auctionId" id="auctionId" type="hidden" value="${auctionId}">
        <input name="lotId" id="lotId" type="hidden" value="${lotId}">
        <div class="form-group">
            <label class="col-sm-2 control-label">LOT</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" placeholder="" id="lotnumber" name="lotnumber" value="${item.lotNumber}" required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" placeholder="NAME" id="name" name="name" value="${item.name}" required>
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">CATEGORY</label>
            <div class="col-sm-3">
                <select class="form-control" name="category" id="category" required>
                    <option value="1">Antique & Collectibles</option>
                    <option value="2">Fine Arts</option>
                    <option value="3">Watches</option>
                    <option value="4">Decorative Arts & Design</option>
                    <option value="5">Jewelry & Fashion</option>
                    <option value="6">Asian Art & Non-European Cultures</option>
                    <option value="7">Post-War & Contemporary Art</option>
                    <option value="8">Clocks & Technology</option>
                    <option value="9">Silver & Vertu</option>
                    <option value="10">Manuscripts,Books & Archives</option>
                    <option value="11">Rugs & Carpets</option>
                </select>
            </div>

        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">ESTIMATE</label>
            <div class="col-sm-3 ">
                <div class="input-group">
                    <div class="input-group-addon">USD</div>
                    <input type="text" class="form-control" value="${item.estimateMin}" placeholder="LOWEST EST" name="estimateMin" id="estimateMin" required>
                </div></div>
            <div class="col-sm-3 ">
                <div class="input-group">
                    <div class="input-group-addon">USD</div>
                    <input type="text" class="form-control" value="${item.estimateMax}"  PLACEHOLDER="HIGHEST ESG" name="estimateMax" id="estimateMax" required>
                </div></div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label">RESERVE PRICE</label>
            <div class="col-sm-3 ">
                <div class="input-group">
                    <div class="input-group-addon">USD</div>
                    <input type="text" class="form-control" value="${item.reservePrice}" name="reservePrice" id="reservePrice" required>
                </div></div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">STARTING PRICE</label>
            <div class="col-sm-3 ">
                <div class="input-group">
                    <div class="input-group-addon">USD</div>
                    <input type="text" class="form-control" value="${item.startingPrice}" name="startingPrice" id="startingPrice" required>
                </div></div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label">PICTURES</label>
            <div class="col-sm-9">
                <input type="file" name="uploadfile" id="uploadfile"  multiple class="file-loading" />
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label">DESCRIPTION</label>
            <div class="col-sm-9">
                <textarea class="form-control" rows="3" id="description" name="description" required>${item.description}</textarea>
            </div>
        </div>
    </form>
    <div class="text-center">
        <button class="btn btn-default">CANCEL</button>
        <button class="btn btn-primary" onclick="submit()" style="width: 220px">CREATE</button>
    </div>

</div>
<script>

    $().ready(function() {
        $("#addform").validate();
    });


    $(function(){
        $("#uploadfile").fileinput({
            uploadUrl: "http://127.0.0.1/testDemo/fileupload/upload.do", //上传的地址
            allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
            //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
//            uploadAsync: true, //默认异步上传
            showUpload: false, //是否显示上传按钮
            showRemove : true, //显示移除按钮
            showPreview : true, //是否显示预览
//            showUploadedThumbs:false,
//            showBrowse:false,
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            dropZoneEnabled: false,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount:true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
    });


        //设置下拉框
        $("#category").val('${item.category}');

    });

    function submit(){
        $("#addform").submit();
    }

</script>
</body>
</html>
