<%--
  Created by IntelliJ IDEA.
  User: gaoyang
  Date: 17/2/26
  Time: 下午4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="include.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<input name="status" type="checkbox" data-size="small">
<script>
    $('[name="status"]').bootstrapSwitch({
        onText:"启动",
        offText:"停止",
        onColor:"success",
        offColor:"info",
        size:"small",
        onSwitchChange:function(event,state){
            if(state==true){
                $(this).val("1");
            }else{
                $(this).val("2");
            }
        }
    })
</script>
</body>
</html>
