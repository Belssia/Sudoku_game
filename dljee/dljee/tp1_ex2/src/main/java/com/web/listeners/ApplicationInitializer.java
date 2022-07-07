package com.web.listeners;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.bo.Utilisateur;
import com.web.helpers.DataManagementFactory;
import com.web.helpers.IGameDataManagement;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class ApplicationInitializer
 *
 */
@WebListener
public class ApplicationInitializer implements ServletContextListener {

	/**
	 * Default constructor.
	 */
	public ApplicationInitializer() {

	}

	public void contextInitialized(ServletContextEvent sce) {
		ServletContext ctx = sce.getServletContext();

		String type = ctx.getInitParameter("type_stockage");

		IGameDataManagement gameData = DataManagementFactory.getFactory(type, ctx);

		ctx.setAttribute("gameData", gameData);

		List<Utilisateur> userList = Collections.synchronizedList(new ArrayList<Utilisateur>());

		ctx.setAttribute("users", userList);

	}

}
