package com.ruoyi.project.platform.apply.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Description: 申请表订单表关联表
 * @Author: jeecg-boot
 * @Date:   2019-06-17
 * @Version: V1.0
 */
@Data
@TableName("apply_orders")
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="apply_orders对象", description="申请表订单表关联表")
public class ApplyOrders {
    
	/**申请表编号*/
	@Excel(name = "申请表编号", width = 15)
    @ApiModelProperty(value = "申请表编号")
	private java.lang.String applyId;
	/**创建人*/
	@Excel(name = "创建人", width = 15)
    @ApiModelProperty(value = "创建人")
	private java.lang.String createBy;
	/**创建时间*/
	@Excel(name = "创建时间", width = 20, dateFormat = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建时间")
	private java.util.Date createTime;
	/**申请与订单关联表id*/
	@TableId(type = IdType.UUID)
    @ApiModelProperty(value = "申请与订单关联表id")
	private java.lang.String id;
	/**订单表编号*/
	@Excel(name = "订单表编号", width = 15)
    @ApiModelProperty(value = "订单表编号")
	private java.lang.String ordersId;
	/**修改人*/
	@Excel(name = "修改人", width = 15)
    @ApiModelProperty(value = "修改人")
	private java.lang.String updateBy;
	/**修改时间*/
	@Excel(name = "修改时间", width = 20, dateFormat = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "修改时间")
	private java.util.Date updateTime;
}
