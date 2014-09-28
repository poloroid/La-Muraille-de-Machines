package fr.epf.computerdatabase.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 * Describe a user
 * @author Paul, Timothée , Mathilde
 *
 */

@Entity
@Table(name="computer")
public class Computer {
	
	@Id
	@GeneratedValue
	private Long id;

	@Column(name="name")
	private String name ;
	
	@Column(name="introduced")
	private Timestamp introduced;
	
	@Column(name="discontinued")
	private Timestamp discontinued;
	
	@ManyToOne
	@JoinColumn(name="company_id")
	@Fetch(FetchMode.JOIN)
	Company company;
	
	
	public Computer(){
	}
	
	public Computer(Long id, String name, Timestamp introduced , Timestamp discontinued, Company company) {
		super();
		this.id = id;
		this.name = name;
		this.introduced = introduced;
		this.discontinued = discontinued;
		this.company = company;

	}	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getIntroduced() {
		return introduced;
	}

	public void setIntroduced(Timestamp introduced) {
		this.introduced = introduced;
	}

	public Timestamp getDiscontinued() {
		return discontinued;
	}

	public void setDiscontinued(Timestamp discontinued) {
		this.discontinued = discontinued;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public static Builder builder() {
		return new Builder();
	}
	
	public static class Builder {
		
		private Computer computer;
		
		private Builder() {
			computer = new Computer();
		}
		
		public Builder id(Long id) {
			computer.id = id;
			return this;
		}
		
		public Builder name(String name) {
			computer.name = name;
			return this;
		}
		
		public Builder introduced(Timestamp introduced) {
			computer.introduced = introduced;
			return this;
		}
		public Builder discontinued(Timestamp discontinued) {
			computer.discontinued = discontinued;
			return this;
		}
		public Builder company(Company company) {
			computer.company = company;
			return this;
		}
		public Computer build() {
			return computer;
		}
		
		
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Computer other = (Computer) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Computer [id=" + id + ", name=" + name + ", introduced="
				+ introduced + ", discontinued=" + discontinued
				+ ", company=" + company + "]";
	}
	
}