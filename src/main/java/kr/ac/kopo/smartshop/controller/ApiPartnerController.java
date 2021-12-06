package kr.ac.kopo.smartshop.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.smartshop.model.Pager;
import kr.ac.kopo.smartshop.model.Partner;
import kr.ac.kopo.smartshop.service.PartnerService;

@RequestMapping("/api/partner")
@RestController
public class ApiPartnerController {
	@Autowired
	PartnerService service;
	
	@GetMapping
	public Map<String, Object> list(Pager pager) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", service.list(pager));
		map.put("pager", pager);
		
		return map;
	}
	
	@GetMapping("/{code}")
	public Partner item(@PathVariable int code) {
		return service.item(code);
	}
	
	@PostMapping
	public Partner add(@RequestBody Partner item) {
		service.add(item);
		
		return item;
	}
	
	@PutMapping
	public Partner update(@RequestBody Partner item) {
		service.update(item);
		
		return item;
	}
	
	@DeleteMapping("/{code}")
	public Integer delete(@PathVariable int code) {
		service.delete(code);
		
		return code;
	}
	
}
