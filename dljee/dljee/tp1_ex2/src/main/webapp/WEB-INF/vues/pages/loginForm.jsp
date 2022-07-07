<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.bo.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.bo.GameState"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>App Game</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/style/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/style/signin.css"
	rel="stylesheet">
	<style>
*{margin:0;padding:0}
body{background:#edf2f7;}

.input_container {
    width: 95%;
    padding: 5px;
    margin: 5px;
    display: flex;
    flex-direction: column;
}
.input_container input{
    display: block;
    width: 95%;
    height: 40px;
    border-radius: .3rem;
    border: 1px solid ;
    padding-left: .5rem;
    padding-right: 1.9rem;
}
.page__container{
	max-width: 460px;
    height: auto;
    box-shadow: 0 4px 6px -1px rgb(0 0 0 / 10%), 0 2px 4px -1px rgb(0 0 0 / 6%);
    background-color:white;
    padding: 25px;
    border-radius: .5rem;
    width: 70%;
}
.page_container_all {
    width: 100vw;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}
.submit_btn{
    cursor: pointer;
    display: block;
    margin-left: auto;
    margin-right: auto;
    margin-top: 25px;
    font-size: .875rem;
    padding: .5rem 1rem;
    text-transform: uppercase;
    letter-spacing: .1em;
    
    font-weight: 600;
    
    border-radius: 0.2rem;
    transition: background-color .5s ease-out;
    border-color: #fff0;
    min-width: 110px;
}
.btn{
color:blue;}}
</style>
</head>

<body>

	<div class="page_container_all">
		<div class="page__container">
		<form class="submit_btn" method="POST"  action="${pageContext.request.contextPath}/LoginServlet">
			<div>
				<a  href="${pageContext.request.contextPath}/UserManagementServlet?create">S'inscrire</a>
			</div>
			<h2 class="input_container">Connexion</h2>
			<label for="inputEmail" class="input_container">Nom d'utilisateur</label> <input
				type="text" class="input_container input" placeholder="Nom d'utilisateur"
				required autofocus name="login"> <label for="inputPassword"
				class="input_container">Mot de passe</label> <input type="password"
				id="inputPassword" class="input_container input" placeholder="Password" name="password"
				required>

			<button class="btn " type="submit">Sign
				in</button>
		</form>

		<div>


			<!-- 	//afficher les message avec JAVA  -->

			<!--  		List<Message> messages = (List<Message>) request.getAttribute("messages"); -->

			<!--  		if (messages != null) { -->
			<!-- 			for (Message it : messages) { -->
			<!-- 			out.print(it); -->
			<!--  			} -->
			<!-- 		} -->



			<!-- Ou mieux on affiche les message avec JSTL -->
			<ul>

				<c:forEach items="${requestScope.messages}" var="msg">

					
					<c:choose>
					  <c:when test="${msg.type == Message.WARN}">
					   <li style="color: yellow">${msg.text}</li>
					  </c:when>
					  <c:when test="${msg.type == Message.INFO}">
					   <li style="color: green">${msg.text}</li>
					  </c:when>
					   <c:when test="${msg.type == Message.ERROR}">
					   <li style="color: red">${msg.text}</li>
					  </c:when>
					  <c:otherwise>
					  <li >${msg.text}</li>
					  </c:otherwise>
					</c:choose>

				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- /container -->
</body>
</html>
