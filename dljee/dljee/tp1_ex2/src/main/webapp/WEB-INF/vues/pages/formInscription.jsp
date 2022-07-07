<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.bo.GameState"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en"><head>
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
    background-color: white;
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
		
		<form method="post" action="${pageContext.request.contextPath}/UserManagementServlet">
			<fieldset>
				<legend>Inscription</legend>
				<p>Entrer vos informations pour s'inscrire sur le site</p>

				<label for="nom">*******nom<span class="requis">*******</span></label> <input
					type="text" id="nom" name="nom" value="" size="20" maxlength="60" /><br />



				<label for="prenom">*****prénom<span class="requis">*****</span></label> <input
					type="text" id="prenom" name="prenom" value="" size="20"
					maxlength="60" /> <br /> 
					
					<label for="motdepasse">**Mot
					depasse <span class="requis">**</span>
				</label> <input type="password" id="motdepasse" name="password" value=""
					size="20" maxlength="20" /><br />
					
					 <label for="nom">Nom
					d'utilisateur</label> <input type="text" id="nom" name=login value=""
					size="20" maxlength="20" /> <br /> <input type="submit"
					value="Inscription" class="btn" /> <br />

			</fieldset>
		</form>
	</div>
</body>

</html>

