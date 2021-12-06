package kr.ac.kopo.smartshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.smartshop.model.Member;
import kr.ac.kopo.smartshop.model.Pager;
import kr.ac.kopo.smartshop.model.Partner;
import kr.ac.kopo.smartshop.model.Product;
import kr.ac.kopo.smartshop.model.Purchase;
import kr.ac.kopo.smartshop.service.PartnerService;
import kr.ac.kopo.smartshop.service.ProductService;
import kr.ac.kopo.smartshop.service.PurchaseService;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	@Autowired
	PurchaseService service;
	
	@Autowired
	ProductService serviceProduct;
	
	@Autowired
	PartnerService servicePartner;
	
	final String path = "purchase/";
	
	@RequestMapping({"/", "/list"})
	public String list(Pager pager, Model model) {
		List<Purchase> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add(Model model, @SessionAttribute Member member) {
		List<Product> listProduct = serviceProduct.list();
		List<Partner> listPartner = servicePartner.list();
		
		model.addAttribute("listProduct", listProduct);
		model.addAttribute("listPartner", listPartner);
		model.addAttribute("user", member.getId());
		
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Purchase item) {
		
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{code}")
	public String update(@PathVariable int code, Model model) {
		Purchase item = service.item(code);
		model.addAttribute("item", item);
		
		List<Product> listProduct = serviceProduct.list();
		model.addAttribute("listProduct", listProduct);
		
		List<Partner> listPartner = servicePartner.list();
		model.addAttribute("listPartner", listPartner);
		
		return path + "update";	
		
	}
	
	@PostMapping("/update/{code}")
	public String update(@PathVariable int code, Purchase item) {
		service.update(item);
		
		return "redirect:../list";
	}
	
	@RequestMapping("/delete/{code}") 
	public String delete(@PathVariable int code) {
		service.delete(code);
		
		return "redirect:../list";
	}	
}
