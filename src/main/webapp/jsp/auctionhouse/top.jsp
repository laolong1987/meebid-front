<%--
  Created by IntelliJ IDEA.
  User: gaoyang
  Date: 17/2/12
  Time: 下午12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="min-height: 10px">
        <div class="container-fluid">
            <div class="nav navbar-left">
                <span class="glyphicon glyphicon-user"></span>重要公告:
                <span>xxxxxxxxxx</span>
            </div>
            <div>
                <div class="nav navbar-right">
                    <a href="#">张三</a>
                    <span class="glyphicon glyphicon-envelope"></span>
                    (<span>12</span>) | 卖家中心
                    <span class="glyphicon glyphicon-phone-alt"></span>服务热线 400-4000400
                </div>
            </div>
        </div>
    </nav>
    <nav class="navbar navbar-default" role="navigation" style="margin-top: 20px;">
        <div class="container-fluid">
            <div class="navbar-header">
                <H1>Meebid</H1>
            </div>
            <div class="nav navbar-right">
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" style="width: 400px" class="form-control" placeholder="请输入搜索关键词">
                    </div>
                    <button type="submit" class="btn btn-default">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </form>
            </div>
        </div>
    </nav>
</div>
<div class="container">
    <div class="row">
        <div class="col-ms-12">
            <button class="btn btn-primary btn-lg" id="but1">
                <span class="glyphicon glyphicon-home"></span><br>
                卖家中心
            </button>
            <button class="btn btn-primary btn-lg" id="but2">
                <span class="glyphicon glyphicon-edit"></span><br>
                创建拍卖
            </button>
            <button class="btn btn-primary btn-lg" id="but3">
                <span class="glyphicon glyphicon-th-large"></span><br>
                拍卖管理
            </button>
            <button class="btn btn-primary btn-lg" id="but4">
                <span class="glyphicon glyphicon-list-alt"></span><br>
                公司资料
            </button>
        </div>
    </div>
</div>
<script>
    $( "#but1" ).click(function() {
        window.location.href="${ctx}/auctionhouse/index";
    });
    $( "#but2" ).click(function() {
        window.location.href="${ctx}/auctionhouse/showcreateauction";
    });
    $( "#but3" ).click(function() {
        window.location.href="${ctx}/auctionhouse/listauction";
    });
    $( "#but4" ).click(function() {
        window.location.href="${ctx}/auctionhouse/auctioninfo";
    });
</script>