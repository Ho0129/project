package project.shopping.musinsa.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import project.shopping.musinsa.domain.ProductVO;
import project.shopping.musinsa.domain.QnaVO;
import project.shopping.musinsa.service.QnaService;

@Controller
@RequestMapping(value = "/")
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/qaregister")
	public void qaregisterGET(Model model, int productNumber) {
		logger.info("qaregisterGET() 호출");
		logger.info("productNumber = " + productNumber);
		model.addAttribute("productNumber", productNumber);

	} // end registerGET()

	@GetMapping("/qaUpdate")
	public void qaUpdateGET(Model model, Integer productQuestionNumber, Integer productNumber, ProductVO vo) {
		logger.info("qaUpdateGET() 호출 , 문의글 번호 : " + productQuestionNumber + ", 상품번호 : " + productNumber);
		QnaVO Qvo = qnaService.read(productQuestionNumber);
		logger.info("Qvo : " + Qvo.toString());
		model.addAttribute("vo", vo);
		model.addAttribute("Qvo", Qvo);
		model.addAttribute("productNumber", productNumber);
	} // end qaUpdateGET()

	@GetMapping("/qaDelete")
	public String qaDeleteGET(Integer productQuestionNumber) {
		logger.info("qaDeleteGET() 호출 : 문의글 번호 = " + productQuestionNumber);
		int result = qnaService.delete(productQuestionNumber);
		if (result == 1) {
			return "redirect:/productQna/Q&A";
		} else {
			return "redirect:/productQna/Q&A";
		}
	} // end qaDeleteGET()
	
	@GetMapping("/Answer")
	public void answerGET(Model model, int productQuestionNumber, int productNumber) {
		logger.info("answerGET() 호출 : 답글 달 문의글 번호 = " + productQuestionNumber);
		QnaVO Qvo = qnaService.read(productQuestionNumber);
		logger.info("Qvo : " + Qvo.toString());
		model.addAttribute("Qvo", Qvo);
		model.addAttribute("productQuestionNumber", productQuestionNumber);
		model.addAttribute("productNumber", productNumber);
	} // end answerGET()

} // end qnaController
