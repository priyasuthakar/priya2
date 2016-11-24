package com.niit.Apple.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.niit.appleproduct.dao.CatagoryDAO;
import com.niit.appleproduct.dao.ProductDAO;
import com.niit.appleproduct.dao.SupplierDAO;
import com.niit.appleproduct.models.Catagory;
import com.niit.appleproduct.models.FileUpload;
import com.niit.appleproduct.models.Product;
import com.niit.appleproduct.models.Supplier;

@Controller
public class ProductController {

	String path = "D:/project workspace/Apple/src/main/webapp/resource/images/";
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private Product product;
	@Autowired
	private CatagoryDAO catagoryDAO;
	@Autowired
	private Catagory catagory;
	@Autowired
	private SupplierDAO supplierDAO;
	@Autowired
	private Supplier supplier;
	
	@RequestMapping(value="/product")
	public String product(Model model){
		model.addAttribute("product", product);  
		model.addAttribute("addproduct", "Add Product");
		model.addAttribute("catagoryList",this.catagoryDAO.list());
		model.addAttribute("supplierList",this.supplierDAO.list());
		return "product";
	}
	@RequestMapping(value = "/product", method = RequestMethod.POST)
	public ModelAndView addproduct(@Valid @ModelAttribute("product") Product product,BindingResult result) {
		ModelAndView mv = new ModelAndView();
		if (result.hasErrors()) {
			mv.addObject("addproduct", "Add Product");
			mv.addObject("catagoryList",this.catagoryDAO.list());
			mv.addObject("supplierList",this.supplierDAO.list());
			mv.setViewName("/product");
		} 
		else {
			Catagory catagory = catagoryDAO.getByName(product.getCat().getName());
			Supplier supplier = supplierDAO.getByName(product.getSup().getName());
			product.setCat(catagory);
			product.setSup(supplier);
			productDAO.saveOrUpdate(product);
			mv.addObject("ProductList", "PRODUCT LIST");
			MultipartFile file=product.getImage();
			FileUpload.upload(path, file, product.getId()+".jpg");
			mv.setViewName("redirect:/viewproduct");
		}
		return mv;
	}
	
	@RequestMapping(value ="viewproduct")
	public ModelAndView  view(@ModelAttribute("product") Product product,Model model) {
		ModelAndView mv = new ModelAndView("viewp");
		Gson gson = new Gson();
		List<Product> plist=productDAO.list();
		String listp = gson.toJson(plist);
		model.addAttribute("listp", listp);
		return mv;
	}
	
	
	@RequestMapping(value ="/p{id}")
	public String deleteproduct(@PathVariable("id") int id,ModelMap model) {
		productDAO.delete(id);
		model.addAttribute("productList",productDAO.list());
		return "redirect:/viewproduct";
	}
	
	@RequestMapping(value ="/edit2{id}")
	public String editproduct(@PathVariable("id") int id,ModelMap model) {
		product = productDAO.get(id);
		model.addAttribute("product", product);
		model.addAttribute("catagoryList",this.catagoryDAO.list());
		model.addAttribute("supplierList",this.supplierDAO.list());
		model.addAttribute("editproduct", "Edit product");
		return "/edit2";
	}
	
	@RequestMapping(value ="/edit2",method=RequestMethod.POST)
	public String  productedit(@ModelAttribute("product") Product product, BindingResult result,ModelMap model) {
		productDAO.saveOrUpdate(product);
		return "redirect:/viewproduct";
	}
	
	}
