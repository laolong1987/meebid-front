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
        .selectworld{
            opacity: 0;
            filter: "alpha(opacity=0)";
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            display: block;
            z-index: 100;
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
                    <div style="position: relative;">
                        <select name="countryId" class="countries order-alpha presel-byip form-control selectworld" id="countryId" onchange="setvalue(this.value,'countryId2')" >
                            <option value="">Select Country</option>
                        </select>
                        <input type="text" class="form-control" name="countryId2" id="countryId2">
                    </div>

                </div>
                <div class="col-sm-4">
                    <div style="position: relative;">
                    <select name="stateId" class="states order-alpha form-control selectworld" id="stateId" onchange="setvalue(this.value,'stateId2')">
                        <option value="">Select State</option>
                    </select>
                    <input type="text" class="form-control" name="stateId2" id="stateId2" >
                    </div>
                </div>
                <div class="col-sm-4">
                    <div style="position: relative;">
                    <select name="cityId" class="cities order-alpha form-control selectworld" id="cityId" onchange="setvalue(this.value,'cityId2')" >
                        <option value="">Select City</option>
                    </select>
                    <input type="text" class="form-control" name="cityId2" id="cityId2">
                        </div>
                </div>
            </div>
            <input type="text" class="form-control" style="margin-top: 20px" id="" name="" placeholder="ADDRESS OF THIS AUCTION">
        </div>
        <div class="form-group">
            <label for="name" class="control-label">TIMEZONE</label>
            <select class="form-control" name="timezone1" id="timezone1" style="width: 550px">
                <option value="0000" >Greenwich Mean Time	GMT</option>
                <option value="+0100" >European Central Time	GMT+1:00</option>
                <option value="+0200" >Eastern European Time	GMT+2:00</option>
                <option value="+0200" >(Arabic) Egypt Standard Time	GMT+2:00</option>
                <option value="+0300" >Eastern African Time	GMT+3:00</option>
                <option value="+0330" >Middle East Time	GMT+3:30</option>
                <option value="+0400" >Near East Time	GMT+4:00</option>
                <option value="+0500" >Pakistan Lahore Time	GMT+5:00</option>
                <option value="+0530" >India Standard Time	GMT+5:30</option>
                <option value="+0600" >Bangladesh Standard Time	GMT+6:00</option>
                <option value="+0700" >Vietnam Standard Time	GMT+7:00</option>
                <option value="+0800" >China Taiwan Time	GMT+8:00</option>
                <option value="+0900" >Japan Standard Time	GMT+9:00</option>
                <option value="+0930" >Australia Central Time	GMT+9:30</option>
                <option value="+1000" >Australia Eastern Time	GMT+10:00</option>
                <option value="+1100" >Solomon Standard Time	GMT+11:00</option>
                <option value="+1200" >New Zealand Standard Time	GMT+12:00</option>
                <option value="-1100" >Midway Islands Time	GMT-11:00</option>
                <option value="-1000" >Hawaii Standard Time	GMT-10:00</option>
                <option value="-0900" >Alaska Standard Time	GMT-9:00</option>
                <option value="-0800" >Pacific Standard Time	GMT-8:00</option>
                <option value="-0700" >Phoenix Standard Time	GMT-7:00</option>
                <option value="-0700" >Mountain Standard Time	GMT-7:00</option>
                <option value="-0600" >Central Standard Time	GMT-6:00</option>
                <option value="-0500" >Eastern Standard Time	GMT-5:00</option>
                <option value="-0500" >Indiana Eastern Standard Time	GMT-5:00</option>
                <option value="-0400" >Puerto Rico and US Virgin Islands Time	GMT-4:00</option>
                <option value="-0330" >Canada Newfoundland Time	GMT-3:30</option>
                <option value="-0300" >Argentina Standard Time	GMT-3:00</option>
                <option value="-0300" >Brazil Eastern Time	GMT-3:00</option>
                <option value="-0100" >Central African Time	GMT-1:00</option>
            </select>
        </div>
        <div class="form-group">
            <label for="name" class="control-label">START TIME</label>
            <div class="row">
                <div class="col-sm-4">
                    <input  type="text" readonly class="form-control form_datetime" name="date1" value="">
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
                <h4 class="modal-title" >New Exhibition</h4>
            </div>
            <div class="modal-body">
                <div class="container">
                <form class="form-horizontal" role="form" id="addform" name="addform" method="post" action="addExhibition">
                    <input type="hidden" id="auctionId" name="auctionId" value="${auctionId}" >
                    <div class="form-group">
                        <label for="name" class="control-label">LOCATION</label>
                        <input type="text" name="exhibitionAddress" id="exhibitionAddress" class="form-control" style="width: 550px" >
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label">TIMEZONE</label>
                        <select class="form-control" name="timezone2" id="timezone2" style="width: 550px">
                            <option value="0000" >Greenwich Mean Time	GMT</option>
                            <option value="+0100" >European Central Time	GMT+1:00</option>
                            <option value="+0200" >Eastern European Time	GMT+2:00</option>
                            <option value="+0200" >(Arabic) Egypt Standard Time	GMT+2:00</option>
                            <option value="+0300" >Eastern African Time	GMT+3:00</option>
                            <option value="+0330" >Middle East Time	GMT+3:30</option>
                            <option value="+0400" >Near East Time	GMT+4:00</option>
                            <option value="+0500" >Pakistan Lahore Time	GMT+5:00</option>
                            <option value="+0530" >India Standard Time	GMT+5:30</option>
                            <option value="+0600" >Bangladesh Standard Time	GMT+6:00</option>
                            <option value="+0700" >Vietnam Standard Time	GMT+7:00</option>
                            <option value="+0800" >China Taiwan Time	GMT+8:00</option>
                            <option value="+0900" >Japan Standard Time	GMT+9:00</option>
                            <option value="+0930" >Australia Central Time	GMT+9:30</option>
                            <option value="+1000" >Australia Eastern Time	GMT+10:00</option>
                            <option value="+1100" >Solomon Standard Time	GMT+11:00</option>
                            <option value="+1200" >New Zealand Standard Time	GMT+12:00</option>
                            <option value="-1100" >Midway Islands Time	GMT-11:00</option>
                            <option value="-1000" >Hawaii Standard Time	GMT-10:00</option>
                            <option value="-0900" >Alaska Standard Time	GMT-9:00</option>
                            <option value="-0800" >Pacific Standard Time	GMT-8:00</option>
                            <option value="-0700" >Phoenix Standard Time	GMT-7:00</option>
                            <option value="-0700" >Mountain Standard Time	GMT-7:00</option>
                            <option value="-0600" >Central Standard Time	GMT-6:00</option>
                            <option value="-0500" >Eastern Standard Time	GMT-5:00</option>
                            <option value="-0500" >Indiana Eastern Standard Time	GMT-5:00</option>
                            <option value="-0400" >Puerto Rico and US Virgin Islands Time	GMT-4:00</option>
                            <option value="-0330" >Canada Newfoundland Time	GMT-3:30</option>
                            <option value="-0300" >Argentina Standard Time	GMT-3:00</option>
                            <option value="-0300" >Brazil Eastern Time	GMT-3:00</option>
                            <option value="-0100" >Central African Time	GMT-1:00</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label">VIEWING TIME</label>
                        <div class="row" style="width: 550px">
                            <div class="col-sm-5">
                                <input  type="text" readonly class="form-control form_datetime" name="datetime1" value="">
                            </div>
                            <div class="col-sm-3">
                                <input  type="text" readonly class="form-control form_datetime2" name="datetime2" value="">
                            </div>
                            <div class="col-sm-3">
                                <input  type="text" readonly class="form-control form_datetime2" name="datetime3" value="">
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
                <button  class="btn btn-default" data-dismiss="modal">CLOSE</button>
                <button  class="btn btn-primary" onclick="addExhibition()">CREATE</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<form action="listmessage" method="post" id="listform" name="listform">
    <input type="hidden" value="" name="pageSize" id="pageSize">
    <input type="hidden" value="" name="page" id="page">
</form>

<script>



    $(function(){
        addevent();
    });





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

    function addExhibition(){
        $("#addform").submit();
    }

    function setvalue(value,name){
        $("#"+name).val(value);
        if('countryId2'==name){
            $("#stateId2").val('');
            $("#cityId2").val('');
        }
        if('stateId2'==name){
            $("#cityId2").val('');
        }
    }

</script>
</body>
</html>
