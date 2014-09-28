package fr.epf.computerdatabase.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.computerdatabase.domain.Company;
import fr.epf.computerdatabase.domain.Computer;
import fr.epf.computerdatabase.service.CompanyDBService;
import fr.epf.computerdatabase.service.ComputerDBService;
/**
 * Servlet implementation class UpdateComputer
 */
@WebServlet("/updateController")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
			System.out.println(req.getParameter("name")+req.getParameter("introduced")+req.getParameter("discontinued")+req.getParameter("company")+"hidden_id="+req.getParameter("hidden_id"));
			ComputerDBService service= ComputerDBService.getInstance();
			Company company=Company.builder().id(Long.parseLong(req.getParameter("company"))).build();
				Computer c=Computer.builder().name(req.getParameter("name")).id(Long.parseLong(req.getParameter("hidden_id"))).company(company).build();
				service.update(c);
			
	}

	
}
