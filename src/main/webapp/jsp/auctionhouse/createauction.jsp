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
                <input type="text" name="name" id="name" class="form-control" placeholder="">
            </div>
            <div class="col-sm-4 checkbox">
                <input type="checkbox" id="" name="" value="1">EXHIBITION ONLY
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">LOCATION</label>
            <div class="col-sm-3">
                <input type="text" class="form-control"  placeholder="CITY" id="city" name="city">
            </div>
            <div class="col-sm-3">
                <input type="text" class="form-control"  placeholder="STATE" id="state" name="state">
            </div>
            <div class="col-sm-3">
                <input type="text" class="form-control"  placeholder="COUNTRY" id="country" name="country">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">TIMEZONE</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="timezone" name="timezone" >
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label">START DATE</label>
            <div class="col-sm-3">
                <select class="form-control" name="month" id="month" >
                    <option value="1" >1</option>
                    <option value="2" >2</option>
                    <option value="3" >3</option>
                    <option value="4" >4</option>
                    <option value="5" >5</option>
                    <option value="6" >6</option>
                    <option value="7" >7</option>
                    <option value="8" >8</option>
                    <option value="9" >9</option>
                    <option value="10" >10</option>
                    <option value="11" >11</option>
                    <option value="12" >12</option>
                </select>
            </div>
            <div class="col-sm-3">
                <select class="form-control" name="day" id="day" >
                    <option value="1" >1</option>
                    <option value="2" >2</option>
                    <option value="3" >3</option>
                    <option value="4" >4</option>
                    <option value="5" >5</option>
                    <option value="6" >6</option>
                    <option value="7" >7</option>
                    <option value="8" >8</option>
                    <option value="9" >9</option>
                    <option value="10" >10</option>
                    <option value="11" >11</option>
                    <option value="12" >12</option>
                    <option value="13" >13</option>
                    <option value="14" >14</option>
                    <option value="15" >15</option>
                    <option value="16" >16</option>
                    <option value="17" >17</option>
                    <option value="18" >18</option>
                    <option value="19" >19</option>
                    <option value="20" >20</option>
                    <option value="21" >21</option>
                    <option value="22" >22</option>
                    <option value="23" >23</option>
                    <option value="24" >24</option>
                    <option value="25" >25</option>
                    <option value="26" >26</option>
                    <option value="27" >27</option>
                    <option value="28" >28</option>
                    <option value="29" >29</option>
                    <option value="30" >30</option>
                    <option value="31" >31</option>
                </select>
            </div>
            <div class="col-sm-3">
                <select class="form-control" name="year" id="year" >
                    <option value="2017" >2017</option>
                    <option value="2018" >2018</option>
                    <option value="2019" >2019</option>
                    <option value="2020" >2020</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label">TIME</label>
            <div class="col-sm-3">
                <select class="form-control" name="house" id="house" >
                    <c:forEach begin="01" end="59" var="i" >
                        <option value="${i}" >${i}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-sm-3">
                <select class="form-control" name="minute" id="minute" >
                    <c:forEach begin="01" end="59" var="i" >
                        <option value="${i}" >${i}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label">DESCRIPTION</label>
            <div class="col-sm-9">
                <textarea class="form-control" rows="3" name="desc" id="desc"></textarea>
            </div>
        </div>
    </form>
    <div class="text-center">
        <button class="btn btn-default">CANCEL</button>
        <button class="btn btn-primary" style="width: 220px" onclick="submit()">CREATE</button>
    </div>

</div>

<script>
    function submit(){
        $("#addform").submit();
    }
</script>
</body>
</html>
