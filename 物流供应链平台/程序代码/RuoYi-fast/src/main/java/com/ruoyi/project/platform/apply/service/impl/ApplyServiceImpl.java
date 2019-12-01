package com.ruoyi.project.platform.apply.service.impl;

import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.platform.apply.mapper.ApplyMapper;
import com.ruoyi.project.platform.apply.domain.Apply;
import com.ruoyi.project.platform.apply.service.IApplyService;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

/**
 * 申请订单 服务层实现
 * 
 * @author ruoyi
 * @date 2019-06-21
 */
@Service
public class ApplyServiceImpl extends ServiceImpl<ApplyMapper, Apply> implements IApplyService
{
	
	@Autowired
	private ApplyMapper mapper;
	
	@Override
	public BigDecimal getSumByApplyId(Wrapper<Apply> wrapper, String percent) {
		return mapper.getSumByApplyId(wrapper, percent);
	}

	@Override
	public List<Apply> selectApplyByDeptRoleUser(Wrapper<Apply> wrapper) {
		return mapper.selectApplyByDeptRoleUser(wrapper);
	}

	@Override
	public Integer selectApplyCountByOrdersIds(Wrapper<Apply> wrapper) {
		return mapper.selectApplyCountByOrdersIds(wrapper);
	}
	
}
