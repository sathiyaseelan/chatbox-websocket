<!DOCTYPE HTML>
<html>
   <head>
	
      <script type="text/javascript">
      
      	var ws;
      	function connect()
      	{
      		name = document.getElementById("name").value;
      		
      		if (name && !ws && "WebSocket" in window)
            {
               
              // Let us open a web socket
              ws = new WebSocket("ws://localhost:8080/ws/chat?name="+name);
              
            }else
            	alert("Web socket is not supported or name is empty");
      		
      		ws.onopen = function()
            {
               // Web Socket is connected, send data using send()
               alert("Connected");
            };
				
            ws.onmessage = function (evt) 
            { 
               var received_msg = evt.data;
               document.getElementById("incoming_messages").innerHTML += "\n"+ received_msg;
            };
				
            ws.onclose = function()
            { 
               // websocket is closed.
               alert("Connection is closed...Please Reconnect...."); 
            };
         
      		
      	}
      	
      	function sendMessage(){
      		
      		message = document.getElementById("message").value;
      		to_user = document.getElementById("to_user").value;
      		ws.send(to_user+":"+message);	
      	}
             
            
         
      </script>
		
   </head>
   <body>
   
      <div id="sse">
      		
      		<textarea id="incoming_messages" style="width:800px;height:500px">
      		</textarea>
      		<br/>
      		<input type="text" id="name" placeholder="Enter your name"/><a href="javascript:connect()">Connect</a>
      		<br/>
      		<label for="to_user" >Send to</label>
      		<input type="text" id="to_user"/>
      		<label for="message" >Message</label>
      		<input type="text" id="message"/>
      		
         <a href="javascript:sendMessage()">Send Message</a>
      </div>
      
   </body>
</html>
