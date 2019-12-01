package com.ruoyi.project.platform.apply.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.project.platform.apply.domain.Orders;
import com.ruoyi.project.platform.apply.mapper.OrdersMapper;
import com.ruoyi.project.platform.apply.service.IOrdersService;

/**
 * @Description: 订单表
 * @Date:   2019-06-13
 * @Version: V1.0
 */
@Service
public class OrdersServiceImpl extends ServiceImpl<OrdersMapper, Orders> implements IOrdersService {
	@Autowired
	private OrdersMapper mapper;
	
	@Override
	public List<Orders> selectOrdersByApplyOrders(Wrapper<Orders> wrapper) {
		return mapper.selectOrdersByApplyOrders(wrapper);
	}

	@Override
	public Orders selectOrdersByOrdersWaybills(Wrapper<Orders> wrapper) {
		return mapper.selectOrdersByOrdersWaybills(wrapper);
	}

}
