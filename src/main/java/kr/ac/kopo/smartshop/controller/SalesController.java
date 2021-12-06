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
import kr.ac.kopo.smartshop.model.Sales;
import kr.ac.kopo.smartshop.model.Stock;
import kr.ac.kopo.smartshop.service.PartnerService;
import kr.ac.kopo.smartshop.service.SalesService;

@Controller
@RequestMapping("/sales")
public class SalesController {
	final String path = "sales/";
	
	@Autowired
	SalesService service;
	
	@Autowired
	PartnerService servicePartner;
	
	@RequestMapping({"/", "/list"})
	public String list(Pager pager, Model model) {
		
		List<Sales> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	
	@GetMapping("/add")
	public String add(Model model, @SessionAttribute Member member) {
		List<Stock> stockList = service.stock();
		List<Partner> listPartner = servicePartner.list();
		
		model.addAttribute("stockList", stockList);
		model.addAttribute("listPartner", listPartner);
		model.addAttribute("user", member.getId());
		
		return path + "add";
		
	}
	
	@PostMapping("/add")
	public String add(Sales item) {
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{code}")
	public String update(@PathVariable int code, Model model) {
		Sales item = service.item(code);
		model.addAttribute("item", item);
		
		List<Stock> stockList = service.stock();
		model.addAttribute("stockList", stockList);
		
		List<Partner> listPartner = servicePartner.list();
		model.addAttribute("listPartner", listPartner);
		
		return path + "update";
	}
	
	@PostMapping("/update/{code}")
	public String update(@PathVariable int code, Sales item) {
		service.update(item);
		
		return "redirect:../list";
	}
	
	@RequestMapping("/delete/{code}")
	public String delete(@PathVariable int code) {
		service.delete(code);
		
		return "redirect:../list";
	}
}
