package project.shopping.musinsa.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import project.shopping.musinsa.domain.PaymentVO;
import project.shopping.musinsa.domain.ProductVO;
import project.shopping.musinsa.service.ProductService;

@RestController
@RequestMapping(value = "/search")
public class SearchRESTController {
	private static final Logger logger = LoggerFactory.getLogger(SearchRESTController.class);
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/{txt}")
	public ResponseEntity<List<ProductVO>> search(@PathVariable("txt") String productName) {
		logger.info("productName = "+productName);
		List<ProductVO> list = productService.readByProductName(productName);
		String[] imgList = null;
		for(ProductVO vo : list) {
			imgList = vo.getProductImg().split(" ");
			vo.setProductImg(imgList[0].toString());
		}
		logger.info(list.toString());
		for(ProductVO vo : list) {
			logger.info(vo.toString()); 
		}
		return new ResponseEntity<List<ProductVO>>(list, HttpStatus.OK);
		
	}
	

	
	
	
}
