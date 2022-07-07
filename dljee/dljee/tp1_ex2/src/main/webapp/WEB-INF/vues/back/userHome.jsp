<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.bo.GameState"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jouer</title>
<style >
*{margin:0;padding:0}
.container__jouer_page{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    max-width: 100vw;
    width: 100vw;
    overflow: hidden;
    height: 100vh;
    max-height: 100vh;
}
body{background:#edf2f7;}
.elements__container{
	max-width: 460px;
    height: auto;
    box-shadow: 0 4px 6px -1px rgb(0 0 0 / 10%), 0 2px 4px -1px rgb(0 0 0 / 6%);
    background-color: #fff;
    padding: 25px;
    border-radius: .5rem;
    width: 70%;
}
.span___text{
    font-size: 14px;
    font-family: cursive;
    color: red;
    margin: 5px 0;
    display: block;
}
.form___container__{
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 15px;
}
.txt____t{
    font-size: 20px;
    font-family: cursive;
    font-weight: 600;
    margin: 0 10px;
    margin-right: 20px;
}
.input___c{
    height: 45px;
    width: 50%;
}
.submit___btn{
    cursor: pointer;
    display: block;
    margin-left: auto;
    margin-right: auto;
    margin-top: 10px;
    font-size: .875rem;
    padding: .5rem 1rem;
    text-transform: uppercase;
    letter-spacing: .1em;
    background: blue;
    font-weight: 600;
    color: white;
    border-radius: 0.2rem;
    transition: background-color .5s ease-out;
    border-color: #fff0;
    min-width: 110px;
    width: 40%;
    height: 50px;
}
</style>
</head>

<body>

<div class="container__jouer_page">
	<div class="elements__container">
	${xx }
		Bonjour
	<c:out value="${sessionScope.gameState.user.nom}" /><br>
	<a href="${pageContext.request.contextPath}/back/bestScore">Meilleurs
		scores</a>|
	<a href="${pageContext.request.contextPath}/back/ReinitGameServlet">Réinitialiser
		le jeu</a>|
	<a href="${pageContext.request.contextPath}/DeconnectServlet">Se
		deconnecter</a> |
		<form method="POST" action="${pageContext.request.contextPath}/back/GameServlet">
			<span class="span___text">Entrer le numero du dés  lancer puis cliquer sur bouton </span>
			<div class="form___container__">
				<div class="txt____t">Numero du dés </div>
				<input type="number"  class="input___c" name="Number__de" max="3" min="1" required="required"/> 
			</div>
			<input type="submit" value="Envoyer" class="submit___btn" />
		</form>
	</div>
</div>
</body>
</html>