<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{room.name}}</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="/resources/js/sockjs.js"></script>
    <script src="/resources/js/stomp.js"></script>
</head>
<body>
<h1>{{room.name}}({{room.id}})</h1>
<div class="content" data-room-id="{{room.id}}" data-member="{{member}}">
    <ul class="chat_box">
    </ul>
    <input name="message">
    <button class="send">������</button>
</div>
<script>
    $(function () {
        var chatBox = $('.chat_box');
        var messageInput = $('input[name="message"]');
        var sendBtn = $('.send');
        var roomId = $('.content').data('room-id');
        var member = $('.content').data('member');

        var sock = new SockJS("/stomp-chat");
        var client = Stomp.over(sock); // 1. SockJS�� ���ο� ��� �ִ� client�� �����ش�.

        // 2. connection�� �ξ����� ����ȴ�.
        client.connect({}, function () {
            // 3. send(path, header, message)�� �޽����� ���� �� �ִ�.
            client.send('/publish/chat/join', {}, JSON.stringify({chatRoomId: roomId, writer: member})); 
            // 4. subscribe(path, callback)�� �޽����� ���� �� �ִ�. callback ù��° �Ķ������ body�� �޽����� ������ ���´�.
            client.subscribe('/subscribe/chat/room/' + roomId, function (chat) {
                var content = JSON.parse(chat.body);
                chatBox.append('<li>' + content.message + '(' + content.writer + ')</li>')
            });
        });

        sendBtn.click(function () {
            var message = messageInput.val();
            client.send('/publish/chat/message', {}, JSON.stringify({chatRoomId: roomId, message: message, writer: member}));
            messageInput.val('');
        });
    });
</script>
</body>
</html>