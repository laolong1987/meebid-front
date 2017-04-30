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
            <button type="button" class="btn btn-primary" onclick="showaddwindows()">
                WRITE NEW MESSAGE
            </button>
            <button type="button" class="btn btn-primary" onclick="updateMessageStateall()">
                MARK ALL READ
            </button>
        </div>
    </div>
    <form action="listmessage" method="post" id="listform" name="listform">
        <input type="hidden" value="" name="pageSize" id="pageSize">
        <input type="hidden" value="" name="page" id="page">
    </form>
    <table class="table table-hover" style="margin-top: 20px" id="messagetable">
        <thead>
        <tr>
            <th>Subject</th>
            <th>Correspondents</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
        <fmt:setLocale value="en_US" scope="session"/>
        <fmt:formatDate value="${date}" type="BOTH" pattern="d MMM yyyy, h:mm:s a"/>
        <c:forEach var="m" items="${listmessage}">
            <c:if test="${m.state eq 0}">
                <tr class="tablecrude" id="${m.id}">
            </c:if>
            <c:if test="${m.state eq 1}">
                <tr class="">
            </c:if>
            <td>${m.subject}</td>
            <td>${m.correspondentName}</td>
            <td><fmt:formatDate value="${m.createTime}"  type="both"  pattern="d MMM yyyy, h:mm:s a"/></td>
            <%--<td>${m.createTime}</td>--%>
            <td class="hidden">${m.content}</td>
            <td class="hidden">${m.id}</td>
            <td class="hidden">${m.correspondent}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
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
    $("[name='my-checkbox']").bootstrapSwitch({
        size: "mini"
    });
</script>
</body>
</html>
