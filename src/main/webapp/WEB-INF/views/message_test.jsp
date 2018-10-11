<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/resources/js/sockjs-0.3.4.min.js"></script>
<script type="text/javascript" src="/resources/js/stomp.min.js"></script>
<script>
var sock = null,
stompClient = null;

// connect() 은 onload 시점에서 수행될 수 있도록 지정
function connect(){
sock = new SockJS("http://localhost:8080/stomp");
stompClient = Stomp.over(sock);    //stomp client 구성
stompClient.connect({}, function(frame){
   console.log('connected stomp over sockjs');
   // subscribe message
   stompClient.subscribe('/subscribe/notice', onMessage);
});

}

function onMessage(message){
console.log("Receive Data from server : "+message);
$("#chatMessageArea").append(message.body+"<br />");
$("#chatArea").scrollTop($("#chatMessageArea").height()-$("#chatArea").height());
}
</script>
<body>

</body>
</html>