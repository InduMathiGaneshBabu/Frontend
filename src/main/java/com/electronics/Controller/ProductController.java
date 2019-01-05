package com.electronics.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.electronics.Dao.CategoryDao;
import com.electronics.Dao.ProductDao;
import com.electronics.Dao.SupplierDao;
import com.electronics.model.Category;
import com.electronics.model.Product;
import com.electronics.model.Supplier;

@Controller
public class ProductController
{

	@Autowired
	ProductDao productDao;
	@Autowired
	CategoryDao categoryDao;
	@Autowired 
	SupplierDao supplierDao;

	
	
	@RequestMapping(value="/product")
	public String ShowProduct(Model m)
	{
		Product product=new Product();
		m.addAttribute("product", product);
		List<Product> listproducts=productDao.listproducts();
		m.addAttribute("productList",listproducts);
		m.addAttribute("categorylist",this.getcategorylist(categoryDao.listcategory()));
		m.addAttribute("supplierlist",this.getSupplierlist(supplierDao.listsupplier()));
	   	return "Product";
	}
	
	
	@RequestMapping(value="/save")
	public String AddProduct(@ModelAttribute("product")Product product,Model m,@RequestParam("pimage")MultipartFile prodimage)
	{
	    productDao.addProduct(product);
	    List<Product> listproducts=productDao.listproducts();
		m.addAttribute("productList",listproducts);
		m.addAttribute("categorylist",this.getcategorylist(categoryDao.listcategory()));
		m.addAttribute("supplierlist",this.getSupplierlist(supplierDao.listsupplier()));
		
		String path="C:\\Users\\Admin\\eclipse-workspace\\serviceFront\\src\\main\\webapp\\resources\\image\\";
		path=path+String.valueOf(product.getProductid())+".jpg";
		File imagefile=new File(path);
		if(!prodimage.isEmpty())
		{
			try
			{
				byte[] buffer=prodimage.getBytes();
				FileOutputStream fos=new FileOutputStream(imagefile);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(buffer);
				bs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			System.out.println("e");
			m.addAttribute("error occured during file upload", "+e");
			
		}
		Product product2=new Product();
		m.addAttribute("product",product2);
		
	    return "Product";
	}
	
	public LinkedHashMap<Integer,String> getcategorylist(List<Category> listcategory)
	{
		LinkedHashMap<Integer,String> categorylist=new LinkedHashMap<Integer,String>();
		
		for(Category category:listcategory)
		{
			categorylist.put(category.getCategoryid(),category.getCategoryname());
		
		}
		return categorylist;
		
	}
	public LinkedHashMap<Integer,String> getSupplierlist(List<Supplier> listsupplier)
	{
		
		LinkedHashMap<Integer,String> supplierlist=new LinkedHashMap<Integer,String>();
		
		for(Supplier supplier:listsupplier)
		{
			supplierlist.put(supplier.getSupplierid(),supplier.getSuppliername());
		}
		return supplierlist;
		
	}
	@RequestMapping(value="/deleteproducts/{productid}")
	public String deleteproduct(@PathVariable("productid")int productid,Model m)
	{
		Product product=productDao.getProduct(productid);
		productDao.deleteProduct(product);
		Product product1=new Product();
		m.addAttribute("categorylist",this.getcategorylist(categoryDao.listcategory()));
		m.addAttribute("supplierlist",this.getSupplierlist(supplierDao.listsupplier()));
		List<Product> listproducts=productDao.listproducts();
		m.addAttribute("productList",listproducts);
		m.addAttribute("product",product1);
		
		return "Product";
	}
	@RequestMapping(value="/editproducts/{productid}")
	public String editproduct(@PathVariable("productid")int productid,Model m)
	{
		Product product=productDao.getProduct(productid);
		m.addAttribute("product",product);
		m.addAttribute("categorylist",this.getcategorylist(categoryDao.listcategory()));
		m.addAttribute("supplierlist",this.getSupplierlist(supplierDao.listsupplier()));
		List<Product> listproducts=productDao.listproducts();
		m.addAttribute("productList",listproducts);
		
		Product product1=new Product();
		m.addAttribute("product1",product1);
		
		
		return "UpdateProduct";
	}
	@RequestMapping(value="/updateproduct",method=RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product1")Product product1,Model m,@RequestParam("pimage")MultipartFile pimage)
	{
	    String path="C:\\Users\\Admin\\eclipse-workspace\\serviceFront\\src\\main\\webapp\\resources\\image\\";
		path=path+String.valueOf(product1.getProductid())+".jpg";
		File imagefile=new File(path);
		if(!pimage.isEmpty())
		{
			try
			{
				byte[] buffer=pimage.getBytes();
				FileOutputStream fos=new FileOutputStream(imagefile);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(buffer);
				bs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			System.out.println("e");
			m.addAttribute("error occured during file upload", "+e");
			
		}
		 productDao.updateProduct(product1);
        Product product2=new Product();
	    List<Product> listproducts=productDao.listproducts();
		m.addAttribute("productList",listproducts);
		m.addAttribute("categorylist",this.getcategorylist(categoryDao.listcategory()));
		m.addAttribute("supplierlist",this.getSupplierlist(supplierDao.listsupplier()));
		m.addAttribute("product",product2);
		return "Product";
	}
	@RequestMapping( value="/productdisplay")
	public String Productdisplay(Model m)
	{
		List<Product> productlist=productDao.listproducts();
		m.addAttribute("productlist",productlist);
		return "ProductDisplay";
		
	}
	@RequestMapping(value="/totalproductdisplay/{productid}")
	public String DisplayProduct(@PathVariable("productid")int productid,Model m)
	{
		Product product=productDao.getProduct(productid);
		m.addAttribute("product",product);
		return "TotalProductDisplay";
		
	}
	
	
}
