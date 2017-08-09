<%--
  Created by IntelliJ IDEA.
  User: gaoyang
  Date: 17/2/12
  Time: 下午12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="include.jsp"%>
<html lang="en">
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
    <div class="text-center" style="padding-top: 20px;padding-bottom: 20px">
        <H2>CREATE NEW AUCTION</H2>
    </div>

    <form class="form-horizontal" role="form" action="createauction" id="addform" name="addform" method="post">
        <div class="form-group">
            <label class="col-sm-2 control-label">NAME</label>
            <div class="col-sm-6">
                <input type="text" name="name" id="name" class="form-control required" placeholder="" required>
            </div>
            <div class="col-sm-4 checkbox">
                <input type="checkbox" id="" name="" value="1">EXHIBITION ONLY
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">LOCATION</label>
            <div class="col-sm-3">
                <select name="countryId" class="countries order-alpha presel-byip form-control" id="countryId" required>
                    <option value="">Select Country</option>
                </select>
            </div>
            <div class="col-sm-3">
                <select name="stateId" class="states order-alpha form-control" id="stateId" required>
                    <option value="">Select State</option>
                </select>
            </div>
            <div class="col-sm-3">
                <select name="cityId" class="cities order-alpha form-control" id="cityId" required>
                    <option value="">Select City</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">TIMEZONE</label>
            <div class="col-sm-6">
                <select class="form-control" name="timezone" id="timezone" required>
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
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label">START TIME</label>
            <div class="col-sm-3">
                <input  type="text" readonly class="form-control form_datetime" name="date1" id="date1" value="" required>
            </div>
            <div class="col-sm-3">
                <input  type="text" readonly class="form-control form_datetime2" name="date2" id="date2" value="" required>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label">DESCRIPTION</label>
            <div class="col-sm-9">
                <textarea class="form-control" rows="3" name="desc" id="desc" required></textarea>
            </div>
        </div>
    </form>
    <div class="text-center">
        <button class="btn btn-default"  onclick="window.history.back()" >CANCEL</button>
        <button class="btn btn-primary" style="width: 220px" onclick="submit()">CREATE</button>
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/js/countrystatecity.js"></script>
<script>

    $().ready(function() {
        $("#addform").validate();
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

    function submit(){
        $("#addform").submit();
    }
</script>
</body>
</html>
