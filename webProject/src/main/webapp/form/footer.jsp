<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="../css/footer.css" />
	<div class="footer">
		<div class="menu">
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Features</a></li>
				<li><a href="#">Pricing</a></li>
				<li><a href="#">FAQs</a></li>
				<li><a href="#">About</a></li>
			</ul>		
		</div>
		<div class="copyright">
			<hr class="long-hr"/>
			<p class="text-center text-muted">&copy; <%=new Date().getYear()+1900 %> Company, Inc</p>	
		</div>
		<div class="sns">
			<img src="../images/footerImages/logo.png" alt="로고" class="logo"/>
			<div class="snslogo">
				<a href="https://www.facebook.com/"><img src="../images/footerImages/facebook.png" alt="페이스북" /></a>
				<a href="https://www.instagram.com/"><img src="../images/footerImages/instagram.png" alt="인스타그램" /></a>
				<a href="https://twitter.com/"><img src="../images/footerImages/twitter.png" alt="트위터" /></a>
			</div>
		</div>
	</div>