package com.electronics.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.electronics.Dao.CategoryDao;
import com.electronics.model.Category;

@Controller
public class CategoryController
{
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping(value="/category")
	public String ShowCategory(Model m)
	{
		List<Category> listcategories=categoryDao.listcategory();
		m.addAttribute("listcategory",listcategories);
		return "Category";
	}
	@RequestMapping(value="/addCategory",method=RequestMethod.POST)
	public String AddCategory(@RequestParam("categoryName")String categoryName,@RequestParam("categoryDesc")String categoryDesc,Model m)
	{
		Category category=new Category();
		category.setCategoryname(categoryName);
		category.setCategorydesc(categoryDesc);
		categoryDao.addCategory(category);
		List<Category> listcategories=categoryDao.listcategory();
		m.addAttribute("listcategory",listcategories);
		return "Category";
	}
	@RequestMapping(value="/editcategory/{categoryid}")
	public String EditCategory(@PathVariable("categoryid")int categoryid,Model m)
	{
		Category category=categoryDao.getCategory(categoryid);
		m.addAttribute("category",category);
		return "UpdateCategory";
	}
	
	@RequestMapping(value="/updatecategory",method=RequestMethod.POST)
	public String UpdateCategory(@RequestParam("categoryName")String categoryName,@RequestParam("categoryId")int categoryId,@RequestParam("categoryDesc")String categoryDesc,Model m)
	{
		Category category=categoryDao.getCategory(categoryId);
		category.setCategoryname(categoryName);
		category.setCategorydesc(categoryDesc);
		categoryDao.updateCategory(category);
		List<Category> listcategories=categoryDao.listcategory();
		m.addAttribute("listcategory",listcategories);
		return "Category";	
	}
	
	@RequestMapping(value="/deletecategory/{categoryid}")
	public String DeleteCategory(@PathVariable("categoryid")int categoryid,Model m)
	{
		Category category=categoryDao.getCategory(categoryid);
		categoryDao.deleteCategory(category);
		List<Category> listcategories=categoryDao.listcategory();
		m.addAttribute("listcategory",listcategories);
		return "Category";
	}
}
