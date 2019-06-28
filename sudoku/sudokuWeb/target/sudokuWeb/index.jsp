<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello World!</h2>
<form id="form1"  method="post" action="<%=request.getContextPath()%>/sendEmail">
    用户名：<input type="text" id="username" name="username">
    <button type="submit" id="submit">发送验证码</button></br>
    验证码: <input type="text" id="code" name="code">
</form>
</body>
</html>
