package com.glabshop.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.glabshop.dao.BrandDAO;
import com.glabshop.dao.CategoryDAO;
import com.glabshop.dao.UserDAO;
import com.glabshop.entity.Brand;
import com.glabshop.entity.Category;
import com.glabshop.entity.User;

@Component
public class Sharelnterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	CategoryDAO catedao;
	
	@Autowired
	BrandDAO branddao;
	
	@Autowired
	UserDAO userDAO;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		List<Category> listcate=catedao.findAll();
		modelAndView.addObject("cates", listcate);

		List<Brand> listbrand=branddao.findAll();
		modelAndView.addObject("brands", listbrand);
		
		List<User> listUser = userDAO.findAll();
		modelAndView.addObject("users", listcate);
		modelAndView.addObject("users", listbrand);
	}
}
