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
        <li class="active">拍卖管理</li>
    </ol>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">拍卖管理</h3>
        </div>
        <div class="panel-body">
            <ul class="list-unstyled">
                <li>
                    <div class="list_auct_box row">
                        <div class="list_auct_content">
                            <div class="col-sm-3">
                                <img class="img-responsive center-block" src="${ctx}/images/noimg.png">
                            </div>
                            <div class="col-sm-6">
                                <dl>
                                    <dt>吉雅翰墨书画精品拍卖专场</dt>
                                    <dd>20件拍品<span class="pull-right">1个待审核</span></dd>
                                    <dd>已有12人参与<span class="pull-right">2预出价</span></dd>
                                    <dd>2016/10/15<span class="pull-right">上海</span></dd>
                                    <dd>下午2点<span class="pull-right">进行中</span></dd>
                                </dl>
                            </div>
                            <div class="col-sm-3">
                                <dl>
                                    <dd>
                                        <button type="button" class="btn btn-primary btn-xs center-block btn1">编辑拍品
                                        </button>
                                    </dd>
                                    <dd>
                                        <button type="button" class="btn btn-primary btn-xs center-block">管理活动
                                        </button>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="list_auct_box row">
                        <div class="list_auct_content">
                            <div class="col-sm-3">
                                <img class="img-responsive center-block" src="${ctx}/images/noimg.png">
                            </div>
                            <div class="col-sm-6">
                                <dl>
                                    <dt>吉雅翰墨书画精品拍卖专场</dt>
                                    <dd>20件拍品<span class="pull-right">1个待审核</span></dd>
                                    <dd>已有12人参与<span class="pull-right">2预出价</span></dd>
                                    <dd>2016/10/15<span class="pull-right">上海</span></dd>
                                    <dd>下午2点<span class="pull-right">进行中</span></dd>
                                </dl>
                            </div>
                            <div class="col-sm-3">
                                <dl>
                                    <dd>
                                        <button type="button" class="btn btn-primary btn-xs center-block">编辑拍品
                                        </button>
                                    </dd>
                                    <dd>
                                        <button type="button" class="btn btn-primary btn-xs center-block">管理活动
                                        </button>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
