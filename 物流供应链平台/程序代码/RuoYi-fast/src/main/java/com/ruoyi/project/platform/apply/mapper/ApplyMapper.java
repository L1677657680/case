package com.ruoyi.project.platform.apply.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.project.platform.apply.domain.Apply;
import com.ruoyi.project.platform.apply.domain.Orders;

/**
 * @Description: 申请表
 * @Author: jeecg-boot
 * @Date:   2019-06-13
 * @Version: V1.0
 */
public interface ApplyMapper extends BaseMapper<Apply> {
	
	/**
	 * 根据申请编号查询相关订单运单的总金额
	 * @param applyId 申请编号
	 * @param percent 百分 总金额的  0.9 即为: 总金额 * 0.9 = 结果
	 * @return
	 */
	public BigDecimal getSumByApplyId(@Param("ew") Wrapper<Apply> wrapper,@Param("percent") String percent);
	
	/**
	 * 部门,角色,用户三表关联查询 通过条件构造器自定义条件查询
	 * @param wrapper
	 * @return
	 */
	public List<Apply> selectApplyByDeptRoleUser(@Param("ew") Wrapper<Apply> wrapper);
	
	/**
	 * 根据订单条件查询申请单数量
	 * @param wrapper
	 * @return
	 */
	public Integer selectApplyCountByOrdersIds(@Param("ew") Wrapper<Apply> wrapper);

}
