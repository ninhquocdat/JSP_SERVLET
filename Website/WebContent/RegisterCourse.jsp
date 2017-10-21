<%@page import="com.sun.org.apache.bcel.internal.classfile.Code" %>
<%@page import="java.util.ArrayList"%>
<jsp:include page="/Header.jsp"></jsp:include>
<%!
	public static final int LOGGED=1;
	public static final int EDIT=2;
	public static final int DEL=0;
	ArrayList<String[]> regisList= new ArrayList<String[]>();
%>
<% 
// Create Course Type
	ArrayList<String> types=new ArrayList<String>();
	types.add("Java Basic ");
	types.add("Java Advaced ");
	types.add(".NET BASIC ");
	types.add(".NET Advanced ");
	types.add("C/C++ ");
	
	ArrayList<String> courses=new ArrayList<String>();
	courses.add("BTJB001-Java Basic ");
	courses.add("BTJB002-Java Basic ");
	courses.add("ATJB001-Java Advaced ");
	courses.add("ATJB002-Java Advaced ");
	courses.add("BTJB001-.NET BASIC  ");
	courses.add("BTJB002-.NET BASIC ");
	courses.add("ATJB001-.NET Advanced  ");
	courses.add("ATJB002-.NET Advanced ");
	courses.add("BTJB001-C/C++  ");
	courses.add("BTJB002-C/C++ ");
	String[] semester={"january","fabruary","march","april","may","june","july","august",
	                   "september","october","november","December"};
	
	ArrayList<String> users;
	// Check session is exist for back to page without loggin
	if(session.getAttribute("userX")!=null){
	    users=(ArrayList<String>)session.getAttribute("userX");
	}
	else{
	    users=new ArrayList<String>();
	}
	if(request.getParameter("flag")!=null && Integer.parseInt(request.getParameter("flag"))==LOGGED){
	    //remove available others session
	 	session.removeAttribute("userX");  
	    String name =request.getParameter("name");
	    String pass=request.getParameter("password");
	    String depart=request.getParameter("depart");
	    users.add(name);
	    users.add(pass);
	    users.add(depart);
	    session.setAttribute("userX", users);
	    
	}
	if(request.getParameter("flag")!=null&&Integer.parseInt(request.getParameter("flag"))==0){
	    regisList.remove(Integer.parseInt(request.getParameter("id")));
	}
	if(request.getParameter("regis")!=null&&Integer.parseInt(request.getParameter("regis"))==1){
	    String year=request.getParameter("year");
	    String s=request.getParameter("semester");
	    String type=request.getParameter("type");
	    String course=request.getParameter("course");
	    
	    String sems=s+","+year;
	    String code=course.substring(0,course.indexOf("-"));
	    String title=course.substring(course.indexOf("-")+1);
	    
	    String[] regisInfo={code,title,type,sems};
	    
	    if(regisList.size()<3){
	        regisList.add(regisInfo);
	    }
	    
	}
%>

<div class="container">
	<div class="info-side">
		<span class="glyphicon glyphicon-user" style="width:10px; height:10px; background:black; border-radius:3px">X</span>
		<%=users.get(0)%>(<%=users.get(2)%>),<a href="${pageContext.request.contextPath}/TraineeLogin.jsp?out">Sign out</a>
		<br/><br/>
		<strong>Available Course:</strong><%=courses.size() %>
		<strong>*Total Course Type:</strong><%=types.size() %>
		<div class="datetime">
			<div><strong>DATE:</strong><label id="date"></label> </div>
		</div>
	</div>
	<div class="register-side">
		<h4>COURSE REGISTRATION</h4>
		<form action="RegisterCourse.jsp?regis=1" method="post" name="registerForm">
			<table>
				<tr>
					<td>Year</td>
					<td>Semester</td>
					<td>Course Type</td>
					<td>Course Code -Title</td>
				</tr>
				<tr>
					<td><input type="text" name="year"/></td>
					<td>
						<select name="semester">
							<%for(int i=0;i<semester.length;i++ ){%>
								<option><%=semester[i] %></option>
							<%}%>
						</select>
					</td>
					<td>
						<select name="type">
							<%for(int i=0;i<types.size();i++ ){%>
								<option><%=types.get(i)%></option>
							<%}%>
						</select>
					</td>
					
					<td>
						<select name="course">
							<%for(int i=0;i<courses.size();i++ ){%>
								<option><%=courses.get(i) %></option>
							<%}%>
						</select>
					</td>
					
				</tr>
				<tr >
					<td><input type="submit" name="register" value="Register"/></td>
				</tr>
				
			</table>
		</form>
		<p><strong>* Node:</strong> <i>Select maximum 3 courses. the courses must not be duplicate</i> </p>
		<table>
			<tr>
				<td>No.</td>
				<td>Course Code</td>
				<td>Course Title</td>
				<td>Course Type</td>
				<td>Semester</td>
				<td>Action</td>
			</tr>	
			<%for(int i=0;i<regisList.size();i++) {%>
			<tr>
				<td><%=i+1 %></td>
				<%for(int j=0;j<regisList.get(i).length;j++) {%>
					<td><%=regisList.get(i)[j] %></td>
				<%} %>	
				<td><a href="${pageContext.request.contextPath}/RegisterCourse.jsp?flag=0&id=<%=i%>">Delete</a></td>
			</tr>
			<%} %>	
			<tr>
				<td colspan="2">Course Total</td>
				<td olspan="4"><%=regisList.size()%></td>
			</tr>
		</table>
	</div>
</div>
<script type="text/javascript">
	var date=new Date();
	var d=date.getDay();
	var m=date.getMonth();
	var y=date.getFullYear();
	document.getElementById("date").innerHTML=" "+d+" "+m+" "+y;
</script>
<isp:include page="/Footer.jsp"></isp:include>