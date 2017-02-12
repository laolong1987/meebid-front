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
        <li class="active">公司资料</li>
    </ol>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">基本资料</h3>
        </div>
        <div class="panel-body">
            <div>
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">用户名
                            <span class="glyphicon glyphicon-asterisk"></span>
                        </label>

                        <div class="col-sm-5">
                            <label class="control-label">monipeixun</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">邮箱地址
                            <span class="glyphicon glyphicon-asterisk"></span>
                        </label>

                        <div class="col-sm-5">
                            <label class="control-label">2332432@QQ.com</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">公司名称
                            <span class="glyphicon glyphicon-asterisk"></span>
                        </label>

                        <div class="col-sm-5">
                            <label class="control-label">联拍在线湖南</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">公司简称
                            <span class="glyphicon glyphicon-asterisk"></span>
                        </label>

                        <div class="col-sm-5">
                            <label class="control-label">联拍在线湖南</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">法人代表
                            <span class="glyphicon glyphicon-asterisk"></span>
                        </label>

                        <div class="col-sm-5">
                            <label class="control-label">陈</label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">国/省/市
                            <span class="glyphicon glyphicon-asterisk"></span>
                        </label>

                        <div class="col-sm-5">
                            <label class="control-label">中国湖南长沙</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">邮编
                            <span class="glyphicon glyphicon-asterisk"></span>
                        </label>

                        <div class="col-sm-5">
                            <label class="control-label">410005</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">营业执照
                            <span class="glyphicon glyphicon-asterisk"></span>
                        </label>

                        <div class="col-sm-5">
                            <label class="control-label">88888888</label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">
                        </label>

                        <div class="col-sm-5">
                            <img src="/images/yyzz.jpg" style="height: 200px"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">组织机构代码
                            <span class="glyphicon glyphicon-asterisk"></span>
                        </label>

                        <div class="col-sm-5">
                            <label class="control-label">666666666</label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">
                        </label>

                        <div class="col-sm-5">
                            <img src="/images/zzjgdm.jpg" style="height: 200px"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">税务登记证号码
                            <span class="glyphicon glyphicon-asterisk"></span>
                        </label>

                        <div class="col-sm-5">
                            <label class="control-label">99999999999</label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">
                        </label>

                        <div class="col-sm-5">
                            <img src="/images/swdj.jpg" style="height: 200px"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-lg-9 col-lg-offset-3">
                            <button type="submit" class="btn btn-primary" id="signup" value="Sign up">修改信息
                            </button>
                            <button type="submit" class="btn btn-primary" id="signup" value="Sign up">修改密码
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
