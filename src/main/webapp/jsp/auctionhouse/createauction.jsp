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
<%--头部 开始--%>
<jsp:include page="top.jsp" />
<%--头部 结束--%>
<div class="container">
    <ol class="breadcrumb" style="background-color: white;margin-top: 20px">
        <li><a href="#">卖家中心</a></li>
        <li>创建拍卖场次</li>
        <li class="active">拍卖基本信息</li>
    </ol>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">拍卖基本信息</h3>
        </div>
        <div class="panel-body">
            <div>
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">本场名称
                            <span class="glyphicon glyphicon-asterisk"></span>
                        </label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="firstname"
                                   placeholder="请输入名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">拍卖开始时间 <span
                                class="glyphicon glyphicon-asterisk"></span></label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="firstname"
                                   placeholder="请选择">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">拍卖场次类型 <span
                                class="glyphicon glyphicon-asterisk"></span></label>

                        <div class="col-sm-5">
                            <select class="form-control" id="firstname">
                                <option>请选择</option>
                                <option>线上线下同步</option>
                                <option>预览</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">拍卖所在地 <span
                                class="glyphicon glyphicon-asterisk"></span></label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="firstname"
                                   placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">联系方式 <span
                                class="glyphicon glyphicon-asterisk"></span></label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="firstname"
                                   placeholder="请输入手机号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">拍卖师姓名 <span
                                class="glyphicon glyphicon-asterisk"></span></label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="firstname"
                                   placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">拍卖师介绍 <span
                                class="glyphicon glyphicon-asterisk"></span></label>

                        <div class="col-sm-5">
                            <textarea class="form-control" id="firstname"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">上传文件 </label>

                        <div class="col-sm-5">
                            <input type="file" class="form-control" id="firstname">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-9 col-lg-offset-3">
                            <button type="submit" class="btn btn-primary btn-lg" name="signup" value="Sign up">提交
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
