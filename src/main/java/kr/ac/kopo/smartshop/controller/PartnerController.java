package kr.ac.kopo.smartshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.smartshop.model.Pager;
import kr.ac.kopo.smartshop.model.Partner;
import kr.ac.kopo.smartshop.service.PartnerService;

@Controller
@RequestMapping("/partner")
public class PartnerController {
	@Autowired
	PartnerService service;
	
	final String path = "partner/";
	
	@RequestMapping({"/", "/list"})
	public String list(Pager pager, Model model) {
		List<Partner> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Partner item) {
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{code}")
	public String update(@PathVariable int code, Model model) {
		Partner item = service.item(code);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/update/{code}")
	public String update(@PathVariable int code, Partner item) {
		service.update(item);
		
		return "redirect:../list";
	}
	
	@RequestMapping("delete/{code}")
	public String delete(@PathVariable int code) {
		service.delete(code);
		
		return "redirect:../list";
	
	}
	
 
}
