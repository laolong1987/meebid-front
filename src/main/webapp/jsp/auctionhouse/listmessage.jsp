<%--
  Created by IntelliJ IDEA.
  User: gaoyang
  Date: 17/3/26
  Time: 下午7:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="include.jsp"%>
<html>
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
    <div class="row auction-top">
        <div class="col-xs-2 auction-top-logo">
            <h2>AUCTIONS</h2>
        </div>
        <div class="col-xs-10">
            <button type="button" class="btn btn-primary" onclick="showaddwindows()">
                WRITE NEW MESSAGE
            </button>
            <button type="button" class="btn btn-primary">
                MARK ALL READ
            </button>
        </div>
    </div>

    <form action="listmessage" method="post" id="listform" name="listform">
        <input type="hidden" value="" name="pageSize" id="pageSize">
        <input type="hidden" value="" name="page" id="page">
    </form>
    <table class="table table-hover" style="margin-top: 20px" id="messagetable">
        <thead>
        <tr>
            <th>Subject</th>
            <th>Correspondents</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
        <fmt:setLocale value="en_US" scope="session"/>
        <fmt:formatDate value="${date}"  type="BOTH"  pattern="d MMM yyyy, h:mm:s a"/>
        <c:forEach var="m" items="${listmessage}" >
            <c:if test="${m.state eq 1}">
                <tr class="tablecrude" id="${m.id}">
            </c:if>
            <c:if test="${m.state eq 0}">
                <tr class="">
            </c:if>
                <td>${m.subject}</td>
                <td>${m.correspondentName}</td>
                <%--<td><fmt:formatDate value="${m.createTime}"  type="both"  pattern="d MMM yyyy, h:mm:s a"/></td>--%>
                <td>${m.createTime}</td>
                <td class="hidden">${m.content}</td>
                <td class="hidden">${m.id}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="text-center">
        <ul class="pagination">
            <%--<li><a href="#">&laquo;</a></li>--%>
            <%--<li class="active"><a href="#">1</a></li>--%>
            <%--<li><a href="#">3</a></li>--%>
            <%--<li><a href="#">4</a></li>--%>
            <%--<li><a href="#">5</a></li>--%>
            <%--<li><a href="#">&raquo;</a></li>--%>
            <c:if test="${page.pagetotal > 1}">
                <c:forEach begin="1" end="${page.pagetotal}" var="i">
                    <li
                    <c:if test="${i eq page.page}">
                        class="active"
                    </c:if>
                    ><a href="#">${i}</a></li>
                </c:forEach>
            </c:if>
        </ul>
    </div>

</div>

<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="">WRITE NEW MESSAGE</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="addform" name="addform" method="post" action="addmessage">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">FROM</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" placeholder="" id="recipients" name="recipients">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">SUBJECT</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" placeholder="" id="subject" name="subject">
                        </div>
                    </div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label">CONTENT</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="content" id="content" rows="3"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
                <button type="button" class="btn btn-primary" onclick="add()">CREATE</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" >Response Needed</h4>
            </div>
            <div class="modal-body">
                <input type="hidden" id="id" name="id" />
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">FROM</label>
                        <div class="col-sm-9 form-span">
                            <span  id="sendname"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">DATE</label>
                        <div class="col-sm-9 form-span">
                            <span  id="sendtime"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-11 form-span">
                            <span  id="sendtext" style="margin-left: 100px"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">REPLY</button>
                <button type="button" class="btn btn-default" onclick="mark()">MARK AS UNREAD</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script>
    function showaddwindows(){
        $('#add').modal('show');
    }

    function add(){
        $("#addform").submit();
    }

    $("#messagetable tr:gt(0)").click(function () {
        var subject=$(this).find("td").eq(0).html();
        var correspondentName=$(this).find("td").eq(1).html();
        var date=$(this).find("td").eq(2).html();
        var content=$(this).find("td").eq(3).html();
        var id=$(this).find("td").eq(4).html();

        updateMessageState(id,'1');

        $("#sendname").text(correspondentName);
        $("#sendtime").text(date);
        $("#sendtext").text(content);
        $("#id").val(id);
        $('#detail').modal('show');
    })

    function mark(){
        updateMessageState($("#id").val(),'0');
        $('#detail').modal('hide');
    }

    function updateMessageState(id,s){
        $.ajax({
            type : "POST",
            url : "updateMessageState",
            data : {messageId:id,state:s},
            dataType : "text",
            success : function(result) {
                if(0==s){
                    $("#"+id).addClass("tablecrude");
                }else{
                    $("#"+id).removeClass("tablecrude");
                }
            }
        });
    }
</script>
</body>
</html>
