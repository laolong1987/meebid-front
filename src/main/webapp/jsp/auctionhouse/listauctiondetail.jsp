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
            <input type="text" class="form-control" id="name" name="name" value="${detail.name}">
        </div>
        <div class="form-group">
            <label for="name" class="control-label">LOCATION</label>
            <div class="row">
                <div class="col-sm-4">
                    <input type="text" class="form-control"  placeholder="CITY" id="city" name="city" value="${detail.city}">
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control"  placeholder="STATE" id="state" name="state" value="${detail.state}">
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control"  placeholder="COUNTRY" id="country" name="country" value="${detail.country}">
                </div>
            </div>
            <input type="text" class="form-control" style="margin-top: 20px" id="" name="" placeholder="ADDRESS OF THIS AUCTION">
        </div>
        <div class="form-group">
            <label for="name" class="control-label">TIMEZONE</label>
            <select class="form-control" name="year" id="year" >
                <option value="" >Greenwich Mean Time	GMT</option>
                <option value="+1:00" >European Central Time	GMT+1:00</option>
                <option value="+2:00" >Eastern European Time	GMT+2:00</option>
                <option value="+2:00" >(Arabic) Egypt Standard Time	GMT+2:00</option>
                <option value="+3:00" >Eastern African Time	GMT+3:00</option>
                <option value="+3:30" >Middle East Time	GMT+3:30</option>
                <option value="+4:00" >Near East Time	GMT+4:00</option>
                <option value="+5:00" >Pakistan Lahore Time	GMT+5:00</option>
                <option value="+5:30" >India Standard Time	GMT+5:30</option>
                <option value="+6:00" >Bangladesh Standard Time	GMT+6:00</option>
                <option value="+7:00" >Vietnam Standard Time	GMT+7:00</option>
                <option value="+8:00" >China Taiwan Time	GMT+8:00</option>
                <option value="+9:00" >Japan Standard Time	GMT+9:00</option>
                <option value="+9:30" >Australia Central Time	GMT+9:30</option>
                <option value="+10:00" >Australia Eastern Time	GMT+10:00</option>
                <option value="+11:00" >Solomon Standard Time	GMT+11:00</option>
                <option value="+12:00" >New Zealand Standard Time	GMT+12:00</option>
                <option value="-11:00" >Midway Islands Time	GMT-11:00</option>
                <option value="-10:00" >Hawaii Standard Time	GMT-10:00</option>
                <option value="-9:00" >Alaska Standard Time	GMT-9:00</option>
                <option value="-8:00" >Pacific Standard Time	GMT-8:00</option>
                <option value="-7:00" >Phoenix Standard Time	GMT-7:00</option>
                <option value="-7:00" >Mountain Standard Time	GMT-7:00</option>
                <option value="-6:00" >Central Standard Time	GMT-6:00</option>
                <option value="-5:00" >Eastern Standard Time	GMT-5:00</option>
                <option value="-5:00" >Indiana Eastern Standard Time	GMT-5:00</option>
                <option value="-4:00" >Puerto Rico and US Virgin Islands Time	GMT-4:00</option>
                <option value="-3:30" >Canada Newfoundland Time	GMT-3:30</option>
                <option value="-3:00" >Argentina Standard Time	GMT-3:00</option>
                <option value="-3:00" >Brazil Eastern Time	GMT-3:00</option>
                <option value="-1:00" >Central African Time	GMT-1:00</option>
            </select>
        </div>
        <div class="form-group">
            <label for="name" class="control-label">START TIME</label>
            <div class="row">
                <div class="col-sm-4">
                    <input  type="text" readonly class="form-control form_datetime" value="">
                </div>
                <div class="col-sm-4">
                    <input  type="text" readonly class="form-control form_datetime2" value="">
                </div>
                </div>
        </div>
        <div class="form-group">
            <label for="name" class="control-label">EXHIBITIONS</label>
            <div id="addnewexhibition">
            <%--<div class="row" style="margin-bottom: 20px">--%>
                <%--<div class="col-sm-8">--%>
                    <%--<input type="text" class="form-control"  placeholder="" id="" name="city">--%>
                <%--</div>--%>
                <%--<div style="margin-top: 10px"><a class="glyphicon glyphicon-trash" onclick="removenewexhibition(this)"></a></div>--%>
            <%--</div>--%>
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
                        <input type="text" class="form-control" style="width: 550px" id="">
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label">VIEWING TIME</label>
                        <div class="row" style="width: 550px">
                            <div class="col-sm-5">
                                <input  type="text" readonly class="form-control form_datetime" value="">
                            </div>
                            <div class="col-sm-3">
                                <input  type="text" readonly class="form-control form_datetime2" value="">
                            </div>
                            <div class="col-sm-3">
                                <input  type="text" readonly class="form-control form_datetime2" value="">
                            </div>
                            <div class="col-sm-1">
                                <div style="margin-top: 10px"><a class="glyphicon glyphicon-plus"></a></div>
                            </div>
                        </div>
                        <div id="addnewexhibition2">

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
    addevent();

    function addnewexhibition(){
        var d='';
        d+='<div class="row" style="margin-bottom: 20px"><div class="col-sm-8">';
        d+='<input type="text" class="form-control"  placeholder="" id="city" name="city"></div>';
        d+='<div style="margin-top: 10px"><a class="glyphicon glyphicon-trash" onclick="removenewexhibition(this)"></a></div></div>';
        $("#addnewexhibition").append(d);
    }


    function addnewexhibition2(){

        $('.glyphicon-plus').addClass("glyphicon-trash").remove("glyphicon-plus");

        var d='';
        d+='<div class="row" style="width: 550px;margin-top: 10px" ><div class="col-sm-5"><input  type="text" readonly class="form-control form_datetime" value=""></div>';
        d+='<div class="col-sm-3"><input  type="text" readonly class="form-control form_datetime2" value=""></div>';
        d+='<div class="col-sm-3"><input  type="text" readonly class="form-control form_datetime2" value=""></div>';
        d+='<div class="col-sm-1"><div style="margin-top: 10px"><a class="glyphicon glyphicon-plus"></a></div></div></div>';
        $("#addnewexhibition2").append(d);


        addevent();
    }

    function addevent(){
        $('.glyphicon-plus').unbind('click').click(function() {
            addnewexhibition2();
        });

        $('.glyphicon-trash').unbind('click').click(function() {
            $(this).parent().parent().parent().remove();
        });


        $(".form_datetime").datetimepicker({
            format: "dd MM yyyy",
            autoclose: true,
            todayBtn: true,
            minView:'month',
            pickerPosition: "bottom-left"
        });

        $(".form_datetime2").datetimepicker({
            format: "hh:ii",
            autoclose: true,
            startView:"day",
            maxView:'day',
            pickerPosition: "bottom-left"
        });
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
