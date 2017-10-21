<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p3>kenhlaptrinh.net</p>
      <script type="text/javascript">
            function demoAlert() {
               alert ("Xin chào các bạn!");
            }
            /**/
            function demoConfirm() {
                var retVal = confirm("Trang này vượt qua sự kiểm duyệt của kenhlaptrinh.net, bạn có muốn tiếp tục?");
               if( retVal == true ){
                  document.write ("Bạn muốn tiếp tục đi tới trang web!");   
               }
            }
            
            /**/
            function demoPrompt() {
               var hoTen = prompt("Nhập họ tên :");
               document.write("Họ tên : " + hoTen);
            }
      </script>
      </script>
   </head>
  
	  
   
   <body>
	  <button onclick="demoAlert();">Demo alert</button>
	  <button onclick="demoConfirm();">Demo confirm </button>
	  <button onclick="demoPrompt();">Demo prompt</button>
   </body>
</html>