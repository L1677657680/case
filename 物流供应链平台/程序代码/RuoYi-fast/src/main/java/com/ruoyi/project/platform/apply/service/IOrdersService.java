package com.ruoyi.project.platform.apply.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.project.platform.apply.domain.Orders;

/**
 * @Description: 订单表
 * @Author: jeecg-boot
 * @Date:   2019-06-13
 * @Version: V1.0
 */
public interface IOrdersService extends IService<Orders> {
	public List<Orders> selectOrdersByApplyOrders(Wrapper<Orders> wrapper);
	public Orders selectOrdersByOrdersWaybills(Wrapper<Orders> wrapper);
}
