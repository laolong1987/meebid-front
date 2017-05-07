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
    <div class="auction-top">
        <div class="col-xs-4 auction-top-logo">
            <h2>AUCTIONS ITEMS</h2>
        </div>
        <div class="col-xs-8">
            <button type="button" class="btn btn-primary" onclick="addnewitem()">
                CREATE NEW ITEM
            </button>
            <button type="button" class="btn btn-primary" onclick="updateMessageStateall()">
                BULK UPLOAD
            </button>
        </div>
    </div>
    <form action="listauctionitem" method="post" id="listform" name="listform">
        <input type="hidden" value="" name="pageSize" id="pageSize">
        <input type="hidden" value="" name="page" id="page">
        <input type="hidden" value="${auctionId}" name="auctionId" id="auctionId">
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
                        <li><B>${a.name}${a.status}</B></li>

                        <li style="padding-top: 20px">
                            <fmt:setLocale value="en_US" scope="session"/>
                            <fmt:formatDate value="${a.start_time}"  type="both"  pattern="d MMM yyyy, h:mm:s a"/>
                        </li>
                        <li>
                            <c:if test="${a.status eq 0}">
                                <span class="label label-default">DRAFT</span>
                            </c:if>
                            <c:if test="${a.status eq 1}">
                                <span class="label label-primary">PUBLISHED</span>
                            </c:if>
                            <c:if test="${a.status eq 2}">
                                <span class="label label-success">HAPPENING NOW</span>
                            </c:if>
                            <c:if test="${a.status eq 3}">
                                <span class="label label-info">PAST</span>
                            </c:if>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-2">
                    <ul class="list-unstyled">
                        <c:if test="${a.status eq 0}">
                            <li> <button type="button" onclick="viewtimes('${a.id}')"
                                         class="btn btn-primary auction-action-btn">MANAGE ITEMS</button></li>
                            <li><a href="">MODIFY INFO</a></li>
                            <li><a href="">CLONE THIS AUCTION</a></li>
                            <li><a href="">DELETE</a></li>
                        </c:if>
                        <c:if test="${a.status eq 1 || a.status eq 2 || a.status eq 3}">
                            <li> <button type="button" class="btn btn-primary auction-action-btn">VIEW ITEMS</button></li>
                            <li> <button type="button" class="btn btn-primary auction-action-btn">VIEW PATICIPANTS</button></li>
                            <li><a href="">CLONE THIS AUCTION</a></li>
                        </c:if>
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
                <li><a href="javascript:;" class="pagejump" onclick="topage('listmessage')" style="margin-left: 10px;">JUMP</a>
                </li>
                <li><input type="text" class="pagejumptext" id="jumppage" name="jumppage"
                           placeholder="1-${page.pagetotal}" onkeyup="keyUp(this)"></li>
            </ul>
        </div>
    </c:if>
    <%-- 分页 结束--%>
</div>

<script>

function addnewitem(){
    $('#listform').attr("action", "showcreateauctionitem").submit();
}

</script>
</body>
</html>
