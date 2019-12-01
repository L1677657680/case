package com.ruoyi.project.platform.apply.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.project.platform.apply.domain.Waybills;
import com.ruoyi.project.platform.apply.mapper.WaybillsMapper;
import com.ruoyi.project.platform.apply.service.IWaybillsService;

/**
 * @Description: 运单表
 * @Author: jeecg-boot
 * @Date:   2019-06-13
 * @Version: V1.0
 */
@Service
public class WaybillsServiceImpl extends ServiceImpl<WaybillsMapper, Waybills> implements IWaybillsService {
	
	@Autowired
	private WaybillsMapper mapper;
	
	@Override
	public List<Waybills> selectListByOrdersId(String ordersId) {
		return mapper.selectListByOrdersId(ordersId);
	}

}
