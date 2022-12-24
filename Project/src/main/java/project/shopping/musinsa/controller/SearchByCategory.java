package project.shopping.musinsa.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import project.shopping.musinsa.domain.ProductVO;
import project.shopping.musinsa.service.ProductService;

@RestController
@RequestMapping(value = "/category")
public class SearchByCategory {
	private static final Logger logger = LoggerFactory.getLogger(SearchRESTController.class);
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/{middleCategory}")
	public ResponseEntity<List<ProductVO>> readProducByMiddleCategory(
			@PathVariable("middleCategory") String middleCategory) {
		logger.info(middleCategory);
		List<ProductVO> list = (List<ProductVO>) productService.readByMiddleCategory(middleCategory);
		return new ResponseEntity<List<ProductVO>>(list, HttpStatus.OK);
	}
	
	
	
}
