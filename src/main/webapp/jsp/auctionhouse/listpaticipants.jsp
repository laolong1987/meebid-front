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
    <style>
        .paticipantbox {
            border: 1px double;
            background-color: #e4e3e3;
            padding-left: 10px;
            margin-top: 20px;
        }

        .biaoqian {
            position: relative;
            left: 200px;
        }
    </style>
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
            <h2>PATICIPANTS</h2>
        </div>
        <div class="col-xs-8">
            <button type="button" class="btn btn-primary" onclick="addnewitem()">
                APPROVE ALL
            </button>
            <button type="button" class="btn btn-primary" onclick="updateMessageStateall()">
                AUTO APPROVAL SETTINGS
            </button>
        </div>
    </div>
    <form action="listauctionitem" method="post" id="listform" name="listform">
        <input type="hidden" value="" name="pageSize" id="pageSize">
        <input type="hidden" value="" name="page" id="page">
        <input type="hidden" value="${auctionId}" name="auctionId" id="auctionId">
        <input type="hidden" name="lotId" id="lotId">
    </form>

    <div style="margin-top: 30px">
        <div class="btn-group">
            <button type="button" onclick="search2('0')" class="btn btn-default ${a0}">ALL <span class="badge">0</span>
            </button>
            <button type="button" onclick="search2('')" class="btn btn-default ${a}">PENDING <span
                    class="badge">0</span></button>
            <button type="button" onclick="search2('0')" class="btn btn-default ${a0}">APPORVED <span
                    class="badge">0</span></button>
            <button type="button" onclick="search2('0')" class="btn btn-default ${a0}">rejected <span
                    class="badge">0</span></button>
        </div>
    </div>
    <div style="margin-top: 30px">
        <div class="container" style="width: 900px;margin-left: 0px">
            <%--<div class="row">--%>
            <c:forEach items="${list}" var="l">
                <div class="col-sm-4">
                    <div class="paticipantbox" onclick="showdetail()">

                        <c:if test="${l.status eq 0}">
                             <span class="label label-default biaoqian">
                            PENDING
                             </span>
                        </c:if>
                        <c:if test="${l.status eq 1}">
                            <span class="label label-success biaoqian">
                            APPROVED
                            </span>
                        </c:if>
                        <c:if test="${l.status eq 2}">
                            <span class="label label-danger biaoqian">
                            REJECTED
                            </span>
                        </c:if>
                        </span>
                        <div class="row" style="margin-top: 10px">
                            <img src="${ctx}/static/images/noimg.png" class="col-sm-4" style="width:70px;">
                            <span class="col-sm-8">${l.userName}</span>
                        </div>
                        <div style="margin-top: 10px;margin-bottom: 10px">
                            Anticipated Amount $${l.anticipatedAmount}
                        </div>
                    </div>
                </div>
            </c:forEach>
            <%--</div>--%>
        </div>
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


<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" >approval</h4>
            </div>
            <div class="modal-body" style="text-align: center">
               <%--approval--%>
                   <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="reply()">APPROVE</button>
                   <button type="button" class="btn btn-default" onclick="mark()">REJECTED</button>
            </div>
            <%--<div class="modal-footer" style="text-align: center">--%>
               <%----%>
            <%--</div>--%>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script>
    var auctionId = '${auctionId}';

    function showdetail(){
        $('#detail').modal('show');
    }
</script>
</body>
</html>
