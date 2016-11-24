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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.niit.appleproduct.dao.SupplierDAO;
import com.niit.appleproduct.models.Supplier;

@Controller
public class SupplierController {

	@Autowired
	private SupplierDAO supplierDAO;
	@Autowired
	private Supplier supplier;
	
	@RequestMapping("/supplier")
	public String supplier(Model model){
		model.addAttribute("supplier", supplier);  
		model.addAttribute("addsupplier", "Supplier added successfully");
		return "supplier";
	}
	
	@RequestMapping(value = "/supplier", method = RequestMethod.POST)
	public ModelAndView addsupplier(@Valid @ModelAttribute("supplier") Supplier supplier,BindingResult result) {
		ModelAndView mv = new ModelAndView();
		if (result.hasErrors()) {
			mv.addObject("addsupplier", "Add Supplier");
			mv.setViewName("/supplier");
		} 
		else {
			supplierDAO.saveOrUpdate(supplier);
			mv.setViewName("redirect:/viewsupplier");
		}
		return mv;
	}
	
	@RequestMapping(value ="viewsupplier")
	public ModelAndView  viewsu(@ModelAttribute("supplier") Supplier supplier,Model model) {
		ModelAndView mv = new ModelAndView("viewsu");
		Gson gson = new Gson();
		List<Supplier> slist=supplierDAO.list();
		String lists = gson.toJson(slist);
		model.addAttribute("lists", lists);
		return mv;
	}
		
	@RequestMapping(value ="/s{id}")
	public String deletesupplier(@PathVariable("id") int id,ModelMap model) {
		supplierDAO.delete(id);
		return "redirect:/viewsupplier";
	}
	
	@RequestMapping(value ="/edit1{id}")
	public String editsupplier(@PathVariable("id") int id,Model model  ) {
		supplier = supplierDAO.get(id); 
		model.addAttribute("supplier", supplier);
		model.addAttribute("editsupplier", "Supplier editted successfully");  
		return "/edit1";
	}
	
	@RequestMapping(value ="/edit1",method=RequestMethod.POST)
	public String  supplieredit(@ModelAttribute("supplier") Supplier supplier, BindingResult result,Model model,RedirectAttributes redirectAttribute) {
	supplierDAO.saveOrUpdate(supplier);
	return "redirect:/viewsupplier";
	}
	}