connect();

 function connect() {
       sock = new SockJS('/echo');
       sock.onopen = function() {
           console.log('open');
       };
       sock.onmessage = function(evt) {
    	   alert("evt="+evt);
        var data = evt.data;
          console.log(data)
          // String을 JSON 형태로 
          // var msgResult = JSON.parse(data)        
          //console.log("msgResult="+msgResult)             
          appendMessage(data);
       };
       sock.onclose = function() {
           //appendMessage("연결을 끊었습니다.");
           console.log('close');
       };
   }
   
 function appendMessage(msg) {  
	 alert("appendMessage of msg="+msg)	
       if(msg == '' || msg == undefined){
          return false;
       }else{
    	   alert("message="+msg);
/*            $.ajax({
               type : 'post',
               data : msg,
                  url : "/qnaResult",
                  success : function(result) {                     
                     $("#chatMessageArea").append(result);
                      $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
                 },
                 error:function(e,code){
                    alert('정말에러!!'+e.status+":"+code)
                     if(e.status==300){
                         alert("데이터를 가져오는데 실패하였습니다.");
                     };
                 }
            });*/
       }
    }
  /* $('#enterBtn').click(function() { connect(); }); $('#exitBtn').click(function() { disconnect(); }); */