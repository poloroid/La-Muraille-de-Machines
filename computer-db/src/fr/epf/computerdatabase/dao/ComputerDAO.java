package fr.epf.computerdatabase.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import fr.epf.computerdatabase.domain.Company;
import fr.epf.computerdatabase.domain.Computer;

public enum ComputerDAO {

	INSTANCE;

	EntityManagerFactory emf;

	public static ComputerDAO getInstance(){
		return INSTANCE;
	}

	private ComputerDAO(){
		emf = Persistence.createEntityManagerFactory("computerdatabase-PU");	
	}

	private EntityManager getEntityManager(){
		return emf.createEntityManager();
	}

	public List<Computer> getAll(int pagenumber, String orderby, String order, String search){
		EntityManager em = null;
		try {
			em = getEntityManager();
			String res = new String();
			List<Computer> rekt = new ArrayList();
			if(search.length()!=0){
				 res="SELECT x FROM Computer x where x.name like '%"+search+"%' or x.name like '%"+search+"%' order by x."+orderby+" "+order;
				  rekt=em.createQuery(res).setFirstResult(pagenumber*20).setMaxResults(20).getResultList();
				  return rekt;
			}
			else{
				 res="SELECT x FROM Computer x order by x."+orderby+" "+order;
				rekt= em.createQuery(res).setFirstResult(pagenumber*20).setMaxResults(20).getResultList();
				return rekt;
			}
		} finally {
			if(em != null){
				em.close();	
			}
		}
	}

	public void create (Computer computer){
		EntityManager em = null;
		try {
			em = getEntityManager();
			em.getTransaction().begin();
			em.persist(computer);
			em.getTransaction().commit();
		} finally {
			if(em != null){
				em.close();	
			}
		}
	}

	public int getNumberOfPages(String orderby, String search){
		EntityManager em = null;
		try {
			em = getEntityManager();
			List<Computer> rekt = new ArrayList();
			String res = new String();
			if(search.length()!=0){
				 res="SELECT x FROM Computer x where x.name like '%"+search+"%' or x.name like '%"+search+"%'";
				  rekt=em.createQuery(res).getResultList();			}
			else{
				 res="SELECT x FROM Computer x order by x."+orderby;
				rekt= em.createQuery(res).getResultList();
			}
			return (int) Math.ceil(Float.parseFloat(Integer.toString(rekt.size()))/20);
		} finally {
			if(em != null){
				em.close();	
			}
		}
	}

	public void delete(int id){
		EntityManager em = null;
		try {
			em = getEntityManager();
			em.getTransaction().begin();
			String hqlDelete = "delete Computer c where c.id ="+id;
			em.createQuery(hqlDelete).executeUpdate();
			em.getTransaction().commit();
		}finally{
			if(em != null){
				em.close();	
			}
		}

	}

	public void update(Computer c) {
		// TODO Auto-generated method stub
		EntityManager em = null;
		try {
			em = getEntityManager();
			em.getTransaction().begin();
			String sql= new StringBuilder()
			.append( "update computer c set c.name=")
			.append("\""+c.getName()+"\"")
			.append(", c.company_id=")
			.append(c.getCompany().getId())
			.append(" where c.id=")
			.append(c.getId())
			.append(";").toString();

			System.out.println(sql);
			em.createNativeQuery(sql).executeUpdate();
			em.getTransaction().commit();
		}finally{
			if(em != null){
				em.close();	
			}
		}
	}
}