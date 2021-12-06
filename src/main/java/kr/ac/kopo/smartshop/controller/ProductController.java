package kr.ac.kopo.smartshop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.smartshop.model.Pager;
import kr.ac.kopo.smartshop.model.Product;
import kr.ac.kopo.smartshop.model.ProductImage;
import kr.ac.kopo.smartshop.service.ProductService;
import kr.ac.kopo.smartshop.util.Uploader;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductService service;
	
	final String path = "product/";
	
	@RequestMapping("/delete_list")
	public String deleteList(@RequestParam("code") List<Integer> list) {
		service.deleteList(list);
		
		return "redirect:list";
	}
	
	@ResponseBody
	@GetMapping("/image/delete/{code}")
	public boolean deleteImage(@PathVariable int code) {
		
		return service.deleteImage(code);
	}
	
	@GetMapping("/view/{code}")
	public String info(@PathVariable int code, Model model) {
		Product item = service.item(code);
		
		model.addAttribute("item", item);
		
		return path + "view";
	}
	
	@RequestMapping("/dummy")
	public String dummy() {
		service.dummy();
		
		return "redirect:list";
	}
	
	@RequestMapping("/init")
	public String init( ) {
		service.init();
		
		return "redirect:list";
	}
	
	
	@RequestMapping({"/", "/list"})
	public String list(Pager pager, Model model) {
		
		List<Product> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
		
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Product item, @RequestParam("productImage") List<MultipartFile> productImage) {
		
		try {
			Uploader<ProductImage> uploader = new Uploader<>();
			
			List<ProductImage> images = uploader.makeList(productImage, ProductImage.class);
			
			item.setImages(images);
			
			service.update(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{code}")
	public String update(@PathVariable int code, Model model) {
		Product item = service.item(code);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}

	@PostMapping("/update/{code}")
	public String update(@PathVariable int code, Product item, @RequestParam("productImage") List<MultipartFile> productImage) {
		item.setCode(code);

		try {
			Uploader<ProductImage> uploader = new Uploader<>();
			
			List<ProductImage> images = uploader.makeList(productImage, ProductImage.class);
			
			item.setImages(images);
		
			service.update(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
		return "redirect:../list";
	}
	
	@RequestMapping("/delete/{code}")
	public String delete(@PathVariable int code) {
		service.delete(code);
		
		return "redirect:../list";
	}
}
