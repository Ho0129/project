package project.shopping.musinsa.domain;

import java.util.Date;

public class ProductVO {
	private int productNumber;
	private String productName;
	private int productPrice;
	private String productInformation;
	private String productSize;
	private String productImg;
	private int productGood;
	private int productGrade;
	private Date productDateRegister;
	private String productMainCategory;
	private String productMiddleCategory;
	private String productBrand;
	public ProductVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductVO(int productNumber, String productName, int productPrice, String productInformation,
			String productSize, String productImg, int productGood, int productGrade, Date productDateRegister,
			String productMainCategory, String productMiddleCategory, String productBrand) {
		super();
		this.productNumber = productNumber;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productInformation = productInformation;
		this.productSize = productSize;
		this.productImg = productImg;
		this.productGood = productGood;
		this.productGrade = productGrade;
		this.productDateRegister = productDateRegister;
		this.productMainCategory = productMainCategory;
		this.productMiddleCategory = productMiddleCategory;
		this.productBrand = productBrand;
	}
	public int getProductNumber() {
		return productNumber;
	}
	public void setProductNumber(int productNumber) {
		this.productNumber = productNumber;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductInformation() {
		return productInformation;
	}
	public void setProductInformation(String productInformation) {
		this.productInformation = productInformation;
	}
	public String getProductSize() {
		return productSize;
	}
	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public int getProductGood() {
		return productGood;
	}
	public void setProductGood(int productGood) {
		this.productGood = productGood;
	}
	public int getProductGrade() {
		return productGrade;
	}
	public void setProductGrade(int productGrade) {
		this.productGrade = productGrade;
	}
	public Date getProductDateRegister() {
		return productDateRegister;
	}
	public void setProductDateRegister(Date productDateRegister) {
		this.productDateRegister = productDateRegister;
	}
	public String getProductMainCategory() {
		return productMainCategory;
	}
	public void setProductMainCategory(String productMainCategory) {
		this.productMainCategory = productMainCategory;
	}
	public String getProductMiddleCategory() {
		return productMiddleCategory;
	}
	public void setProductMiddleCategory(String productMiddleCategory) {
		this.productMiddleCategory = productMiddleCategory;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	@Override
	public String toString() {
		return "ProductVO [productNumber=" + productNumber + ", productName=" + productName + ", productPrice="
				+ productPrice + ", productInformation=" + productInformation + ", productSize=" + productSize
				+ ", productImg=" + productImg + ", productGood=" + productGood + ", productGrade=" + productGrade
				+ ", productDateRegister=" + productDateRegister + ", productMainCategory=" + productMainCategory
				+ ", productMiddleCategory=" + productMiddleCategory + ", productBrand=" + productBrand + "]";
	}
	
	
	
}
