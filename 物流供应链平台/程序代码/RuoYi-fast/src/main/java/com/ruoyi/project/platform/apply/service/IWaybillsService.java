package com.ruoyi.project.platform.apply.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.project.platform.apply.domain.Waybills;

/**
 * @Description: 运单表
 * @Author: jeecg-boot
 * @Date:   2019-06-13
 * @Version: V1.0
 */
public interface IWaybillsService extends IService<Waybills> {
	//根据订单编号获取运单列表
	public List<Waybills> selectListByOrdersId(String ordersId);
}
