package com.ruoyi.project.platform.apply.service;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.project.platform.apply.domain.Apply;

/**
 * @Description: 申请表
 * @Author: jeecg-boot
 * @Date:   2019-06-13
 * @Version: V1.0
 */
public interface IApplyService extends IService<Apply> {
	/**
	 * 根据申请编号查询相关订单运单的总金额
	 * @param applyId 申请编号
	 * @param percent 百分 总金额的  0.9 即为: 总金额 * 0.9 = 结果
	 * @return
	 */
	public BigDecimal getSumByApplyId(Wrapper<Apply> wrapper,String percent);

	public List<Apply> selectApplyByDeptRoleUser(Wrapper<Apply> wrapper);

	public Integer selectApplyCountByOrdersIds(Wrapper<Apply> wrapper);

}
