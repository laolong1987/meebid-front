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
            <button type="button" class="btn btn-default">按钮 1</button>
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
    </div>
</div>


<script>
    function tocreateauctions(){
        window.location.href="createauction";
    }
</script>
</body>
</html>
