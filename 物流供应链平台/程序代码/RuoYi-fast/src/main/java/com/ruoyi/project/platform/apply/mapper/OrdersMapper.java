package com.ruoyi.project.platform.apply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.platform.apply.domain.Orders;

/**
 * @Description: 订单表
 * @Author: jeecg-boot
 * @Date:   2019-06-13
 * @Version: V1.0
 */
public interface OrdersMapper extends BaseMapper<Orders> {
	/**
	 * 条件构造器查询订单列表
	 * @param wrapper
	 * @return
	 */
	public List<Orders> selectOrdersByApplyOrders(@Param("ew") Wrapper<Orders> wrapper);
	
	/**
	 * 条件构造器查询订单列表
	 * @param wrapper
	 * @return
	 */
	public Orders selectOrdersByOrdersWaybills(@Param("ew") Wrapper<Orders> wrapper);
}
