package com.fdmgroup.AgentServlets;
import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class FileLocationContextListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		System.out.println("I'M ALIVE!!!");
		String rootPath = "C:/Users/divyanshu.gupta/JavaEclipseWorkspace/ProjectFrontEnd/WebContent/UploadDir/";
		String dir = "UploadDir";
		ServletContext ctx = servletContextEvent.getServletContext();
		File file = new File(rootPath + File.separator);
		System.out.println("path: " + file);
		if (!file.exists())
			file.mkdirs();
		System.out.println("Made dir");
		ctx.setAttribute("FILES_DIR", rootPath);
		ctx.setAttribute("DIR", dir);
	}

	@Override
	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		System.out.println("NOOOOOOO!!!! I WANT TO LIVE!!!");
	}

}