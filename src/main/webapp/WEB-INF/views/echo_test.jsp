<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/sockjs.js"></script>
<script type="text/javascript" src="resources/js/sockjs_sub.js"></script>
<script type="text/javascript">
 
    $(function(){
        $("#sendBtn").click(function(){
            sendMessage();
        });
    });

    function sendMessage(){
            //websocket으로 메시지를 보내겠다.
            sock.send($("#message").val());
    }
    
</script>
</head>
<body>
 
    <input type="text" id="message"/>
    <input type="button" id="sendBtn" value="전송"/>
    <div id="data"></div>
 
</body>
</html>
