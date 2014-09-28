package fr.epf.computerdatabase.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.print.DocFlavor.URL;
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

@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Get a service
		ComputerDBService computerDBService = ComputerDBService.getInstance();
		//GET PAGENUMBER BITCH
		int pagenumber;
		String orderby=null;
		String order=null;
		String search=null;
		if(req.getQueryString()!=null){
			System.out.println("REQ NOT NULL");
			orderby=req.getParameter("orderby");
			order=req.getParameter("order");
			search=req.getParameter("search");
			System.out.println(orderby);
			if(orderby==null ){
				orderby="name";
			}
			if(order==null ){
				order="asc";
			}
			if(search==null ){
				search="";
			}
			try{
				pagenumber=Integer.parseInt(req.getParameter("p"));
			}
			catch(NumberFormatException e){
				pagenumber=0;
			}
		}
		else{
			pagenumber=0;
			orderby="name";
			order="desc";
			search="";

		}
		int numberOfPages=computerDBService.getNumberOfPages(orderby, search);
		System.out.println(numberOfPages);
		//Add the computer list
		req.setAttribute("computers", computerDBService.getAll(pagenumber,orderby,order, search));		
		req.setAttribute("numberOfPages",numberOfPages);
		req.setAttribute("currentPage",pagenumber);
		if(numberOfPages!=0){
		req.setAttribute("nextPage",(pagenumber+1)%numberOfPages);
		}
		req.setAttribute("orderby",orderby);
		req.setAttribute("order",order);
		req.setAttribute("query",search);

		if((pagenumber-1)<0){
			req.setAttribute("previousPage",numberOfPages);
		}
		else{
			req.setAttribute("previousPage",pagenumber-1);

		}
		//get companyList for the modal
		CompanyDBService companyDBService = CompanyDBService.getInstance();
		//Add the computer list
		req.setAttribute("companies", companyDBService.getAll());		

		//Get the dispatcher JSP
		RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/dashboard.jsp");

		//Forward the request
		dispatcher.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		//Get computer form request
		Computer computer = populateComputer(req);


		System.out.println(computer);


		ComputerDBService service = ComputerDBService.getInstance();

		//Persist the computer
		service.create(computer);

		doGet(req,resp);


	}

	private Computer populateComputer(HttpServletRequest req) {
		//GEt form data
		Long id= Long.parseLong(req.getParameter("id"));
		String name = (String)req.getParameter("name");
		Timestamp introduced=Timestamp.valueOf(req.getParameter("introduced"));
		Timestamp discontinued=Timestamp.valueOf(req.getParameter("discontinued"));
		Company company=new Company();
		company.setName((String)req.getParameter("company"));
		Computer computer = Computer.builder()
				.id(id)
				.name(name)
				.introduced(introduced)
				.discontinued(discontinued)
				.company(company)
				.build();
		return computer;
	}

}