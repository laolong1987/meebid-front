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
        <div class="col-xs-4 auction-top-logo">
            <h2>AUCTIONS DETAILS</h2>
        </div>
        <div class="col-xs-8">
            <button type="button" class="btn btn-primary" onclick="showaddwindows()">
                DETELE THIS AUCTION
            </button>
        </div>
    </div>
    <div class="">
    <form role="form">
        <div class="form-group">
             <label for="name" class="control-label">AUCTION NAME</label>
            <input type="text" class="form-control" id="name">
        </div>
        <div class="form-group">
            <label for="name" class="control-label">LOCATION</label>
            <div class="row">
                <div class="col-sm-4">
                    <input type="text" class="form-control"  placeholder="CITY" id="city" name="city">
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control"  placeholder="STATE" id="state" name="state">
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control"  placeholder="COUNTRY" id="country" name="country">
                </div>
            </div>
            <input type="text" class="form-control" style="margin-top: 20px" id="name">
        </div>
        <div class="form-group">
            <label for="name" class="control-label">TIMEZONE</label>
            <input type="text" class="form-control" id="name">
        </div>
        <div class="form-group">
            <label for="name" class="control-label">START TIME</label>
            <div class="row">
                <div class="col-sm-4">
                    <input type="text" class="form-control"  placeholder="" id="city" name="city">
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control"  placeholder="" id="state" name="state">
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="control-label">EXHIBITIONS</label>
            <div id="addnewexhibition">
            <div class="row" style="margin-bottom: 20px">
                <div class="col-sm-8">
                    <input type="text" class="form-control"  placeholder="" id="city" name="city">
                </div>
                <div style="margin-top: 10px"><a class="glyphicon glyphicon-trash" onclick="removenewexhibition(this)"></a></div>
            </div>
            </div>
            <button type="button" onclick="showaddwindows()" class="btn btn-primary" >ADD NEW EXHIBITION</button>
        </div>
        <div class="form-group">
            <label for="name" class="control-label">SALE OVERVIEW</label>
            <textarea class="form-control" rows="3" name="desc" id="desc"></textarea>
        </div>
        <div class="text-center">
            <button class="btn btn-default">SAVE</button>
        </div>
    </form>
    </div>
</div>

<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="">New Exhibition</h4>
            </div>
            <div class="modal-body">
                <div class="container">
                <form class="form-horizontal" role="form" id="addform" name="addform" method="post" action="addmessage">
                    <input type="hidden" id="recipients" name="recipients" >
                    <div class="form-group">
                        <label for="name" class="control-label">LOCATION</label>
                        <input type="text" class="form-control" style="width: 550px" id="name">
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label">VIEWING TIME</label>
                        <div class="row" style="width: 550px">
                            <div class="col-sm-4">
                                <input type="text" class="form-control ">
                            </div>
                            <div class="col-sm-4">
                                <input type="text" class="form-control ">
                            </div>
                            <div class="col-sm-4">
                                <input type="text" class="form-control ">
                            </div>
                        </div>
                    </div>
                </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
                <button type="button" class="btn btn-primary" onclick="add()">CREATE</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<form action="listmessage" method="post" id="listform" name="listform">
    <input type="hidden" value="" name="pageSize" id="pageSize">
    <input type="hidden" value="" name="page" id="page">
</form>

<script>
    function addnewexhibition(){
        var d='';
        d+='<div class="row" style="margin-bottom: 20px"><div class="col-sm-8">';
        d+='<input type="text" class="form-control"  placeholder="" id="city" name="city"></div>';
        d+='<div style="margin-top: 10px"><a class="glyphicon glyphicon-trash" onclick="removenewexhibition(this)"></a></div></div>';
        $("#addnewexhibition").append(d);
    }

    function removenewexhibition(obj){
        $(obj).parent().parent().remove();
    }

    function showaddwindows(){
        $('#add').modal('show');
    }


</script>
</body>
</html>
