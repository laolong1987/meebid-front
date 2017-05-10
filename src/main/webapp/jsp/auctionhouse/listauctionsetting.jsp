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
<div class="auction-main container" style="padding-left: 200px">
    <div class="row auction-top">
        <div class="auction-top-logo">
            <h2>AUCTIONS SETTINGS</h2>
        </div>
    </div>
    <div class="">
        <form role="form">
            <div class="form-group">
                <label for="name" class="control-label">AUCTION NAME</label>
                <input type="text" class="form-control" id="name">
            </div>
            <div class="form-group">
                <label for="name" class="control-label">BID INCREMENTS</label>

                <div class="row">
                    <div class="col-sm-4">
                        <label for="name" class="control-label">From</label>
                    </div>
                    <div class="col-sm-4">
                        <label for="name" class="control-label">To</label>
                    </div>
                    <div class="col-sm-4">
                        <label for="name" class="control-label">Increment</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="estimateMin"  value="0">
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="estimateMin"  onblur="addincrements(this)" value="-">
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="estimateMin"  value="">
                    </div>
                </div>

                <div id="incrmentdiv">

                </div>

            </div>
            <div class="form-group">
                <label for="name" class="control-label">BUYER PREMIUM</label>

                <div class="input-group col-sm-4">
                    <input type="text" class="form-control" name="estimateMin" id="estimateMin">

                    <div class="input-group-addon">%</div>
                </div>
            </div>

            <div class="form-group">
                <label for="name" class="control-label">PAYMENT OPTIONS</label>
                <textarea class="form-control" rows="3" name="desc"></textarea>
            </div>
            <div class="form-group">
                <label for="name" class="control-label">SHIPPING</label>
                <textarea class="form-control" rows="3" name="desc"></textarea>
            </div>

            <div class="text-center">
                <button class="btn btn-default">SAVE</button>
            </div>
        </form>
    </div>
</div>

<form action="listmessage" method="post" id="listform" name="listform">
    <input type="hidden" value="" name="pageSize" id="pageSize">
    <input type="hidden" value="" name="page" id="page">
</form>

<script>

    function addincrements(obj){
        var a=obj.value;
        if(!isNaN(a)) {
            var d='';
            d+='<div class="row"><div class="col-sm-4">';
            d+='<input type="text" class="form-control" name="estimateMin" value="'+a+'"></div>';
            d+='<div class="col-sm-4">';
            d+='<input type="text" class="form-control" name="estimateMin"  onblur="addincrements(this)" value="-">';
            d+='</div><div class="col-sm-4">';
            d+='<input type="text" class="form-control" name="estimateMin" ></div></div>';
            $("#incrmentdiv").append(d);
        }else{
            $(obj).val("-");
            //删除以后的行
            $(obj).parent().parent().nextAll().remove();
        }
    }

</script>
</body>
</html>
