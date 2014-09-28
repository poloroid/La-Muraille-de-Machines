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
 * Servlet implementation class AddComputer
 */
@WebServlet("/addComputer")
public class AddComputerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddComputerController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CompanyDBService companyDBService = CompanyDBService.getInstance();
		//Add the computer list
		req.setAttribute("companies", companyDBService.getAll());		
		
		System.out.println(req.getAttribute("companies"));
		
		//Get the dispatcher JSP
		RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/addComputer.jsp");

		//Forward the request
		dispatcher.forward(req, resp);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Computer computer = populateComputer(req);
		   String site = new String("/computer-db/dashboard");
		   resp.setStatus(resp.SC_MOVED_TEMPORARILY);
		   resp.setHeader("Location", site); 
	}

	private Computer populateComputer(HttpServletRequest req) {
		//GEt form data
		String name = (String)req.getParameter("name");
		System.out.println(name);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");

		Date parsed;
		try {
			Date parsedIntroduced = format.parse(req.getParameter("introduced"));
			Timestamp introduced = new Timestamp(parsedIntroduced.getTime());
			System.out.println(introduced);

			Date parsedDiscontinued = format.parse(req.getParameter("discontinued"));
			Timestamp discontinued = new Timestamp(parsedDiscontinued.getTime());
			System.out.println(discontinued);
			Long company_id = Long.parseLong(req.getParameter("company"));
			Company company= new Company().builder().id(company_id).build();
			Computer computer = Computer.builder()
					.name(name)
					.introduced(introduced)
					.discontinued(discontinued)
					.introduced(introduced)
					.company(company)
					.build();
			ComputerDBService service = ComputerDBService.getInstance();
			service.create(computer);
			System.out.println(computer);
			return computer;

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

}
