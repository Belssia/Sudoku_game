<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result </title>
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
    font-size: 18px;
    font-family: cursive;
    color: blue;
    margin: 5px 0;
    display: block;
}
.form___container__{
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 15px;
    font-size: 27px;
    font-family: cursive;
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
a.submit___btn{
    text-decoration: none;
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
   	width: 30%;
    height: 30px;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
}
.form___container__ span {
    font-size: 15px;
    padding: 5px;
    font-family: cursive;
}
</style>
</head>
<% String Context_path=request.getServletContext().getContextPath(); %>
<body>
<div class="container__jouer_page">
	<div class="elements__container">
			<span class="span___text"> Partie terminee !</span>
			<div class="form__container_">
			|<span> Resultat des dés: ${ gameState.getMessages() } </span>
				|<span> Votre Score : ${ sessionScope.user.score } </span> |
				<span> Meilleur Score : ${ sessionScope.user.bestScore } </span> |
			</div>
			<a class="submit___btn" href="<%=Context_path%>/back/ReinitGameServlet" />Rejouer</a>
	</div>
</div>
</body>
</html>