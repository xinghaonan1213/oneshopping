package com.xhn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhn.dao.CustomerMapper;



@Service
public class CustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	
}
