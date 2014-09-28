package fr.epf.computerdatabase.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import fr.epf.computerdatabase.domain.Company;
import fr.epf.computerdatabase.domain.Computer;

public enum CompanyDAO {

	INSTANCE;

	EntityManagerFactory emf;

	public static CompanyDAO getInstance(){
		return INSTANCE;
	}

	private CompanyDAO(){
		emf = Persistence.createEntityManagerFactory("computerdatabase-PU");	
	}

	private EntityManager getEntityManager(){
		return emf.createEntityManager();
	}

	public List<Company> getAll(){
		EntityManager em = null;
		try {
			em = getEntityManager();
			return em.createQuery("SELECT x FROM Company x").getResultList();
		} finally {
			if(em != null){
				em.close();	
			}
		}
	}

	public void create (Company company){
		EntityManager em = null;
		try {
			em = getEntityManager();
			em.getTransaction().begin();
			em.persist(company);
			em.getTransaction().commit();
		} finally {
			if(em != null){
				em.close();	
			}
		}
	}
	private void closeObjects(Connection connection, Statement statement,
			ResultSet resultSet) {
		if(resultSet != null){
			try {
				resultSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		//Step 4 Close Statement
		if(statement != null){
			try {
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		//Step 5 Close connection
		if(connection != null){
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
