package fr.epf.computerdatabase.service;

import java.util.List;

import fr.epf.computerdatabase.dao.ComputerDAO;
import fr.epf.computerdatabase.domain.Company;
import fr.epf.computerdatabase.domain.Computer;

public class ComputerDBService {
	
	private static ComputerDBService instance = null ;
	
	//static to be call without an instance
	public static ComputerDBService getInstance(){
		
		if(instance == null){
			//If there is no instance yet just created it.
			instance = new ComputerDBService();
		} 
		return instance;
	}
	
	private ComputerDBService(){
		
	}
	public void create(Computer computer){
		computerDAO.create(computer);
	}
	
	private ComputerDAO computerDAO = ComputerDAO.getInstance();
	
	public Computer get(Long id){
		return null; //computerDAO.get(id);
	}
	
	public List<Computer> getAll(int pagenumber, String orderby, String order, String search){
		return computerDAO.getAll(pagenumber, orderby, order, search);
	}
	public int getNumberOfPages(String orderby, String search){
		return computerDAO.getNumberOfPages(orderby, search);
	}

	public void delete(int id) {
		computerDAO.delete(id);
	}

	public void update(Computer c) {
		// TODO Auto-generated method stub
		computerDAO.update(c);
	}
	
	

}