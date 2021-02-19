package com.pills;

public class PillsDTO {
	
	private String name;
	private String brand;
	private String gender;
	private String age;
	private String ingre;
	private String effic;
	private String price;
	private String note;
	
	public PillsDTO(String name, String brand, String gender, String age, String ingre, String effic, String price,
			String note) {
		super();
		this.name = name;
		this.brand = brand;
		this.gender = gender;
		this.age = age;
		this.ingre = ingre;
		this.effic = effic;
		this.price = price;
		this.note = note;
	}

	public String getName() {
		return name;
	}

	public String getBrand() {
		return brand;
	}

	public String getGender() {
		return gender;
	}

	public String getAge() {
		return age;
	}

	public String getIngre() {
		return ingre;
	}

	public String getEffic() {
		return effic;
	}

	public String getPrice() {
		return price;
	}

	public String getNote() {
		return note;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public void setIngre(String ingre) {
		this.ingre = ingre;
	}

	public void setEffic(String effic) {
		this.effic = effic;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
