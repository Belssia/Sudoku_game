package com.web.servlets;

import java.io.IOException;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import com.bo.GameState;
import com.bo.Message;
import com.bo.Utilisateur;
import com.web.helpers.GameContextManagement;


public class GameServlet extends HttpServlet {

	public GameServlet() {

	}
	
	protected void play(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// On récupére la session de l'utilisateur en cours
		HttpSession session = request.getSession();
		


		// On récupére de la session, les informations du joueur en cours
		Utilisateur user = (Utilisateur) session.getAttribute("user");

		// Pour gérer les données de l'application dans le ServletContext
		GameContextManagement gameContext = GameContextManagement.getInstance(getServletContext());

		// Cette objet déjà inséré dans la session au moment de login
		GameState gameState = (GameState) session.getAttribute("gameState");
		if (user.getCompteurLancer() == 3) {

			if (!gameState.isGameOver()) {
				// On ajoute un message d'information
				gameState.addMessage(new Message("Game Over", Message.INFO));

				// On vérifie s'il faut mettre à jour le meilleur score pour ce joueur
				if (user.getScore() > user.getBestScore()) {

					// Si oui alors mise à jour des données dans la session
					user.setBestScore(user.getScore());

					// Mise à jour des données dans le contexte de l'application
					gameContext.updateScore(user);
				}

			}

			// On indique que le jeu est terminé
			gameState.setGameOver(true);

			// On redirige vers la vue par une redirection au niveau du serveur
			getServletContext().getRequestDispatcher("/WEB-INF/vues/back/userHome.jsp").forward(request, response);

			// On arrete l'execution
			return;

		
		
		}
		else {
			if(gameState.isGameOver() == false) {
			//Number et le numero de de qui va choisir l'utilisateur
			String Number = request.getParameter("Number__de");
			//on verifie que number est null dans la session cad lutilisateur n'a pas encore choisi un de
			if(session.getAttribute(Number) == null) {
		//apres avoir choisir le de a lancé v sera la valeur de dé generer par random 
			
			int v = (int) (Math.random()*6) +1;
			gameState.addMessage(new Message(String.valueOf(v), Message.INFO));
			//on ajoute dans la session le num de dé lance et sa valeur
			session.setAttribute(Number,v);
			if((Number.equals("1") && v==6) || (Number.equals("2") && v==6))
			{
				user.setScore(0);
				gameState.setGameOver(true);
				response.sendRedirect(request.getContextPath()+"/Result.jsp");
			}
			else {
				//on get la valeur généré de chaque de lancé pour qu'on puisse faire la comparaison entre ces valeur 
			
				Object v1=session.getAttribute("1");
				Object v2=session.getAttribute("2");
				Object v3=session.getAttribute("3");
				//si on lance le dé 1 et apres on lance le deusieme qui sera  soit le dé 2soit le dé 3 si on trouve que la valeur de dé 1 et sup a la valeur de 2eme dé on stock 0 dans le score on sor
				if(Number.equals("1") && (( v2!=null && v>=(int)v2)||( v3!=null && v>=(int)v3))) {
					
					user.setScore(0);
					gameState.setGameOver(true);
					
					response.sendRedirect(request.getContextPath()+"/Result.jsp");
					
				
				}
				//maintenant on passe au dé2 si sa valeur est inf au val de dé1 mais elle est sup au val de dé 3 de meme on stock 0 dans le score et on sort 
          else if(Number.equals("2") &&(( v1!=null && v<=(int)v1)||( v3!=null && v>=(int)v3))) {
					
					user.setScore(0);
					gameState.setGameOver(true);

					response.sendRedirect(request.getContextPath()+"/Result.jsp");
				}
          else if(Number.equals("3") && (( v1!=null && v<=(int)v1)||( v2!=null && v<=(int)v2))) {
	
	        user.setScore(0);
	        gameState.setGameOver(true);

	response.sendRedirect(request.getContextPath()+"/Result.jsp");
	//si ce n'est ppas le cas cad v1<v2<v3 dans ce cas le score recoit la somme des valeurs des trois dés
}else {
	if( v1!=null && v2!=null && v3!=null) {
	int result=(int)v1+(int)v2+(int)v3;
	user.setScore((double)result);
	gameState.setGameOver(true);
	if (user.getScore() > user.getBestScore()) {

		user.setBestScore(user.getScore());

		 gameContext.updateScore(user);
		 
	}response.sendRedirect(request.getContextPath()+"/Result.jsp");
	}
	else {
		session.setAttribute(Number, v);
	
		request.getRequestDispatcher("/jouer.jsp").forward(request, response);
	}
}
}
}
  else {

gameState.setGameOver(true);
user.setScore(-1);
getServletContext().getRequestDispatcher("/Result.jsp").forward(request, response);
}}
}
}


				
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		play(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		play(request, response);

	}

}
