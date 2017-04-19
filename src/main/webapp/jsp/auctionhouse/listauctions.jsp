<%--
  Created by IntelliJ IDEA.
  User: gaoyang
  Date: 17/3/26
  Time: 下午7:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="include.jsp"%>
<html>
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

    <div class="row auction-top">
        <div class="col-xs-2 auction-top-logo">
            <h2>AUCTIONS</h2>
        </div>
        <div class="col-xs-2">
            <button type="button" class="btn btn-primary" onclick="tocreateauctions()">
                CREATE NEW AUCTION
            </button>
        </div>
    </div>

    <div style="margin-top: 30px">
        <div class="btn-group">
            <button type="button" class="btn btn-default">DRAFT</button>
            <button type="button" class="btn btn-default">PUBLISHED</button>
            <button type="button" class="btn btn-default">HAPPENING</button>
            <button type="button" class="btn btn-default">PAST</button>
        </div>
    </div>

    <div style="margin-top: 30px">

        <c:forEach items="${auctionses}" var="a">
        <div class="row auction-box">
            <div class="col-xs-2">
                <img src="${ctx}/static/images/noimg.png">
            </div>
            <div class="col-xs-8">
                <ul class="list-unstyled">
                    <li><B>${a.name}</B></li>

                    <li>
                        <fmt:setLocale value="en_US" scope="session"/>
                        <fmt:formatDate value="${a.start_time}"  type="both"  pattern="d MMM yyyy, h:mm:s a"/>
                    </li>
                    <li> <button type="button" class="btn btn-default">33333</button></li>
                </ul>
            </div>
            <div class="col-xs-2">
                <ul class="list-unstyled">
                    <li> <button type="button" class="btn btn-primary auction-action-btn">33333</button></li>
                    <li>111111</li>
                    <li>2222</li>
                    <li>4444</li>
                </ul>
            </div>
        </div>
        </c:forEach>
        <%-- 分页 开始--%>
        <div class="text-center">
            <ul class="pagination">
                <c:if test="${page.page > 10}">
                    <li><a href="listauctions?page=${page.page-10}">&laquo;</a></li>
                </c:if>
                <c:forEach begin="${page.beginpage}" end="${page.endpage}" var="i">
                    <li
                            <c:if test="${i eq page.page}">
                                class="active"
                            </c:if>
                    ><a href="listauctions?page=${i}">${i}</a></li>
                </c:forEach>
                <c:if test="${page.pagetotal-page.page >10}">
                    <li><a href="listauctions?page=${page.page+10}">&raquo;</a></li>
                </c:if>
                <li><a href="javascript:;" class="pagejump" onclick="topage('listauctions')" style="margin-left: 10px;">JUMP</a></li>
                <li><input type="text" class="pagejumptext" id="jumppage" name="jumppage" placeholder="1-${page.pagetotal}" onkeyup="keyUp(this)"></li>
            </ul>
        </div>
        <%-- 分页 结束--%>
    </div>
</div>


<script>
    function tocreateauctions(){
        window.location.href="createauction";
    }
</script>
</body>
</html>
