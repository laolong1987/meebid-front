<%--
  Created by IntelliJ IDEA.
  User: gaoyang
  Date: 17/3/26
  Time: 下午7:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="include.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- top start -->
<jsp:include page="top.jsp"/>
<!-- top end  -->
<!-- top left -->
<jsp:include page="left.jsp"/>
<!-- top left -->
<!-- top left -->
<jsp:include page="auctionsleft.jsp"/>
<!-- top left -->
<div class="auction-main" style="margin-left: 275px">
    <div class="auction-top row">
        <div class="col-xs-4 auction-top-logo">
            <h2>AUCTIONS ITEMS</h2>
        </div>
        <div class="col-xs-8">
            <button type="button" class="btn btn-primary" onclick="addnewitem()">
                CREATE NEW ITEM
            </button>
            <button type="button" class="btn btn-primary" onclick="showupload()">
                BULK UPLOAD
            </button>
        </div>
    </div>
    <form action="listauctionitem" method="post" id="listform" name="listform">
        <input type="hidden" value="" name="pageSize" id="pageSize">
        <input type="hidden" value="" name="page" id="page">
        <input type="hidden" value="${auctionId}" name="auctionId" id="auctionId">
        <input type="hidden" name="lotId" id="lotId" >
    </form>

    <div style="margin-top: 30px">
        <div class="btn-group">
            <button type="button" onclick="search2('')" class="btn btn-default ${a}">VALID</button>
            <button type="button" onclick="search2('0')" class="btn btn-default ${a0}">INVALID</button>
        </div>
    </div>
    <div style="margin-top: 30px">
        <c:forEach items="${list}" var="a">
            <div class="row auction-box">
                <div class="col-xs-2">
                    <img src="${a.thumbImg}">
                </div>
                <div class="col-xs-8">
                    <ul class="list-unstyled">
                        <li><B>${a.name}</B></li>
                        <li style="padding-top: 20px">
                                ${a.category}
                        </li>
                        <li>
                            Estimate $${a.estimateMin}-$${a.estimateMax},start at $${a.startingPrice}
                        </li>
                    </ul>
                </div>
                <div class="col-xs-2">
                    <ul class="list-unstyled">
                        <li>
                            <button type="button" onclick="modifyitem('${a.id}')"
                                    class="btn btn-primary auction-action-btn">MODIFY
                            </button>
                        </li>
                        <li><a href="javascript:;" onclick="deleteitem('${a.id}')">DELETE</a></li>
                    </ul>
                </div>
            </div>
        </c:forEach>
        <%--分页 开始--%>
        <c:if test="${page.page ne 0}">
            <div class="text-center">
                <ul class="pagination">
                    <c:if test="${page.page > 10}">
                        <li><a href="listmessage?page=${page.page-10}">&laquo;</a></li>
                    </c:if>
                    <c:forEach begin="${page.beginpage}" end="${page.endpage}" var="i">
                        <li
                                <c:if test="${i eq page.page}">
                                    class="active"
                                </c:if>
                        ><a href="listmessage?page=${i}">${i}</a></li>
                    </c:forEach>
                    <c:if test="${page.pagetotal-page.page >10}">
                        <li><a href="listmessage?page=${page.page+10}">&raquo;</a></li>
                    </c:if>
                    <li><a href="javascript:;" class="pagejump" onclick="topage('listmessage')"
                           style="margin-left: 10px;">JUMP</a>
                    </li>
                    <li><input type="text" class="pagejumptext" id="jumppage" name="jumppage"
                               placeholder="1-${page.pagetotal}" onkeyup="keyUp(this)"></li>
                </ul>
            </div>
        </c:if>
        <%-- 分页 结束--%>
    </div>
</div>


<div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" >BULK UPLOAD</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="uploadform" name="uploadform" action="uploadauctionitem" method="post" enctype="multipart/form-data">
                    <input type="hidden"  name="auctionId"  value="${auctionId}"/>
                    <div class="form-group">
                        <div class="col-sm-11 form-span">
                            <input type="file" name="file" id="file" accept=".xls"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <a href="" style="margin-left: 100px">DOWNLOAD TEMPLATE</a>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="submit()">UPLOAD</button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="uploadform2" name="uploadform2" action="uploadauctionitemzip" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="auctionId"  value="${auctionId}"/>
                    <div class="form-group">
                        <div class="col-sm-11 form-span">
                            <input type="file" name="file2" id="file2" accept=".zip"  />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="submit2()">UPLOAD ZIP</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script>
    var auctionId = '${auctionId}';

    function addnewitem() {
        $('#listform').attr("action", "showcreateauctionitem").submit();
    }

    function modifyitem(lotid) {
        $('#lotId').val(lotid);
        addnewitem(lotid);
    }


    function deleteitem(lotId) {
        $.ajax({
            type: "POST",
            url: "deleteitem",
            data: {lotId: lotId, auctionId: auctionId},
            dataType: "text",
            success: function (result) {
                history.go(0);
            }
        });
    }

    function showupload(){
        $("#upload").modal('show');
    }

    function submit() {
        var file=$("#file").val();
        if(""==file){
            alert("请提交数据");
            return
        }
        $("#uploadform").submit();

    }

    function submit2() {
        var file=$("#file2").val();
        if(""==file){
            alert("请提交数据");
            return
        }
        $("#uploadform2").submit();

    }

</script>
</body>
</html>
