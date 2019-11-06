package com.xhn.dao;

import com.xhn.bean.Customer;
import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Customer record);

    Customer selectByPrimaryKey(Integer cid);

    List<Customer> selectAll();

    int updateByPrimaryKey(Customer record);
}