package project.shopping.musinsa.domain;

public class CartProductVO {
	private CartVO cartVO;
	private ProductVO productVO;
	
	public CartProductVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartProductVO(CartVO cartVO, ProductVO productVO) {
		super();
		this.cartVO = cartVO;
		this.productVO = productVO;
	}
	public CartVO getCartVO() {
		return cartVO;
	}
	public void setCartVO(CartVO cartVO) {
		this.cartVO = cartVO;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	@Override
	public String toString() {
		return "CartProductVO [cartVO=" + cartVO + ", productVO=" + productVO + "]";
	}
	
	
	
	
	
}
