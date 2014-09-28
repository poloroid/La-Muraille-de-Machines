package fr.epf.computerdatabase.service;

import java.util.List;

import fr.epf.computerdatabase.dao.CompanyDAO;
import fr.epf.computerdatabase.domain.Company;

public class CompanyDBService {
private static CompanyDBService instance = null ;
	
	//static to be call without an instance
	public static CompanyDBService getInstance(){
		
		if(instance == null){
			//If there is no instance yet just created it.
			instance = new CompanyDBService();
		} 
		return instance;
	}
private CompanyDBService(){
		
	}
	public void create(Company company){
		companyDAO.create(company);
	}
	
	private CompanyDAO companyDAO = CompanyDAO.getInstance();
	
	public Company get(Long id){
		return null; //companyDAO.get(id);
	}
	
	public List<Company> getAll(){
		return companyDAO.getAll();
	}
}
