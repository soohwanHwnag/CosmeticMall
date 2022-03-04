package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IDeliveryDao;

@Service
public class DeliveryService {
	@Autowired
	private IDeliveryDao deliveryDao;
}
