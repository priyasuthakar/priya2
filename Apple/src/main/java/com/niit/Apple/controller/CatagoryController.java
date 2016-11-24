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
import com.niit.appleproduct.dao.CatagoryDAO;
import com.niit.appleproduct.models.Catagory;

@Controller
public class CatagoryController {

	@Autowired
	private CatagoryDAO catagoryDAO;
	@Autowired
	private Catagory catagory;

	@RequestMapping("/catagory")
	public String catagory(Model model) {
		model.addAttribute("catagory", catagory);
		model.addAttribute("addcatagory", "Add Catagory");
		return "catagory";
	}

	@RequestMapping(value = "/catagory", method = RequestMethod.POST)
	public ModelAndView addcategory(@Valid @ModelAttribute("catagory") Catagory catagory,BindingResult result) {
		ModelAndView mv = new ModelAndView();
		if (result.hasErrors()) {
			mv.addObject("addcatagory", "Add Catagory");
			mv.setViewName("/catagory");
		} 
		else {
			catagoryDAO.saveOrUpdate(catagory);
			mv.setViewName("redirect:/viewcatagory");
		}
		return mv;
	}

/*	
	 * @RequestMapping(value ="/catagory",method=RequestMethod.POST) public
	 * String catagoryadd(@ModelAttribute("catagory") Catagory catagory,
	 * BindingResult result,Model model,RedirectAttributes redirectAttribute) {
	 * catagoryDAO.saveOrUpdate(catagory); return "redirect:/viewcatagory"; }
*/	 

	@RequestMapping(value = "viewcatagory")
	public ModelAndView view(@ModelAttribute("catagory") Catagory catagory, Model model) {
		ModelAndView mv = new ModelAndView("view");
		Gson gson = new Gson();
		List<Catagory> clist = catagoryDAO.list();
		String list = gson.toJson(clist);
		model.addAttribute("list", list);
		return mv;
	}

	@RequestMapping(value = "/{id}")
	public String deletecatagory(@PathVariable("id") int id, ModelMap model) {
		catagoryDAO.delete(id);
		model.addAttribute("catagoryList", catagoryDAO.list());
		return "redirect:/viewcatagory";
	}

	@RequestMapping(value = "/editc{id}")
	public String editcatagory(@PathVariable("id") int id, ModelMap model) {
		catagory = catagoryDAO.get(id);
		model.addAttribute("catagory", catagory);
		model.addAttribute("editcatagory", "Edit Catagory");
		return "/edit";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String catagoryedit(@ModelAttribute("catagory") Catagory catagory, BindingResult result, Model model,
			RedirectAttributes redirectAttribute) {
		model.addAttribute("catagory", catagory);
		model.addAttribute("editcatagory", "Edit Catagory");
		catagoryDAO.saveOrUpdate(catagory);
		return "redirect:/viewcatagory";
	}

	
/*	 * @RequestMapping(value="/edit",method=RequestMethod.POST) public
	 * ModelAndView catagoryedit(@ModelAttribute("catagory") Catagory
	 * catagory,Model model) { catagoryDAO.saveOrUpdate(catagory);
	 * System.out.println("Error"); ModelAndView mv = new ModelAndView("/view");
	 * Gson gson = new Gson(); List<Catagory> clist=catagoryDAO.list(); String
	 * list = gson.toJson(clist); System.out.println("catagory viewed"+list);
	 * model.addAttribute("catagoryList", list);
	 * 
	 * return mv;
	 * 
	 * mv.addObject("catagoryList",catagoryDAO.list());
	 * 
	 * }
*/	 
}
