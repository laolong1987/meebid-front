<%--
  Created by IntelliJ IDEA.
  User: gaoyang
  Date: 17/2/12
  Time: 下午12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ include file="include.jsp"%>--%>
<!--left menu start-->
<div class="auctionleftMenu">
    <button type="button" class="btn btn-default btn-sm">
        DRAFT
    </button>
    <button type="button" class="btn btn-primary btn-sm">
        PUBLISH NOW
    </button>
    <div style="margin-top: 20px">
        Live auction?
        <input type="checkbox" name="my-checkbox" checked>
    </div>
    <ul class="list-unstyled" style="margin-top: 20px;" >
        <li class="" style="cursor: pointer" onclick="toauctionmenu('showlistauctiondetail')">AUCTION DETAILS</li>
        <li class="" style="cursor: pointer" onclick="toauctionmenu('showlistauctionsetting')">AUCTION SETTINGS</li>
        <li class="" style="cursor: pointer" onclick="toauctionmenu('listauctionitem')">ITEMS</li>
        <li class="" style="cursor: pointer" onclick="toauctionmenu('listpaticipants')">PATICIPANTS</li>
    </ul>
</div>
<form action="" method="post" name="tourl" id="tourl">
    <input id="auctionId" name="auctionId" type="hidden" value="${auctionId}">
</form>
<!--left menu end-->
<script>
    $("[name='my-checkbox']").bootstrapSwitch({
        size: "mini"
    });

    function toauctionmenu(url){
        $("#tourl").attr("action", url);
        $("#tourl").submit();
    }


</script>