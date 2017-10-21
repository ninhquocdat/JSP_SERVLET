<jsp:include page="/Header.jsp"></jsp:include>
<title>Home page</title>
<script type="text/javascript">
	function validateName(){
		var name =document.LoginForm.name.value;
		if(name==""){
			document.getElementById("error").innerHTML="Trainnes name is not allow to blank";
			 alert ("Xin chào các bạn!");
			return false;
		}
		return true;
	}
	function validatePassword(){
		var pass=document.LoginForm.password.value;
		if(pass==""||pass.length<6||pass.length>20){
			alert("Invalid password");
			document.getElementById("error").innerHTML="Invalid password";
			return false;
		}
		if(pass.indexOf(" ")>0){
			document.getElementById("error").innerHTML="password is not allow blank space";
			return false;
		}
		return true;
	}
	function validateForm(){
		if(validateName()&&validatePassword()){
			return true;
		}
		return false;
	}
</script>
<div class="banner">
	<h2>Trainee Informaion System</h2>
</div>
<%!
	String[] departs ={"CTC","NRI","FSU1","FSU17"};
%>
<%
	if(request.getParameter("out")!=null){
	    session.removeAttribute("userX");
	}
%>
<div class="container">
	<div class="left-side">
		<p>*Anouncement: </p>
		<h4>FEATURED COURSES</h4>
		<ul style="list-style-type: decimal;">
			<li><a href=""><strong>ASQL</strong>Advanced SQL for Developer-English</a>
				<ul>
					<li>Method: Online</li>
					<li>Duration: 4.1 hours</li>
				</ul>
			</li>
			<li><a href=""><strong>ATJB</strong><pre>-Advanced Technical Java based-
			English</pre></a>
				<ul>
					<li>Method: Online</li>
					<li>Duration: 4.9 hours</li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="right-side">
		<div class="label-login">
			<img alt="login image" src="${pageContext.request.contextPath}/images/flower.jpg">
			<h4>LOGIN</h4>
		</div>
		<form action="RegisterCourse.jsp?flag=1" method="post" name="LoginForm" onsubmit=" return validateForm();">
			<label class="error" id="error"></label>
			<table class="table table-border">
				<tr>
					<td class="label">Trainee Name</td>
					<td><input type="text" name="name"/></td>
				</tr>
				<tr>
					<td class="label">Password</td>
					<td><input type="password" name="password"/></td>
				</tr>
				<tr>
					<td class="label">Department</td>
					<td>
						<select class="selection" name="depart">
							<%
								for(int i=0;i<departs.length;i++){
								    out.print("<option>"+departs[i]+"</option>");
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="submit" name="login" class="btn-round btn-primary" value="Login"/></td>
					<td><input type="reset" name="clear" class="btn-round btn-warning" value="Clean"/></td>
				</tr>
			</table>
		</form>
	</div>
</div>

<jsp:include page="/Footer.jsp"></jsp:include>