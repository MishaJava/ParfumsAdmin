package com.entity;

/**
 *<h1>Parfum Enitity</h1>
 *This class is representing a table in database.
 * @author admin
 * @since 2016-10-03
 * 
 */
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
@Entity
public class Parfum {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "Category" , nullable = false, updatable = true)
	private String category;
	@Column(name = "Name" , nullable = false, updatable = true)
	private String name;
	@Column(name = "Subname" , nullable = false, updatable = true)
	private String subname;
	@Column(name = "Opus" , nullable = false, updatable = true)
	private String opus;
	@Column(name = "Ml" , nullable = false, updatable = true)
	private String ml;
	@Column(name = "Price" , nullable = false, updatable = true)
	private String price;
	@Lob
	private String base64String;
	@Lob
	private byte[] array;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSubname() {
		return subname;
	}
	
	public void setSubname(String subname) {
		this.subname = subname;
	}

	public String getMl() {
		return ml;
	}
	
	public void setMl(String ml) {
		this.ml = ml;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getOpus() {
		return opus;
	}
	
	public void setOpus(String opus) {
		this.opus = opus;
	}

	public String getBase64String() {
		return base64String;
	}
	
	public void setBase64String(String base64String) {
		this.base64String = base64String;
	}
	
	public byte[] getArray() {
		return array;
	}
	
	public void setArray(byte[] array) {
		this.array = array;
	}
	
}
