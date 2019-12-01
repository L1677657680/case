package com.ruoyi.project.platform.apply.domain;

import java.io.Serializable;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Description: 订单运单关联表
 * @Author: jeecg-boot
 * @Date:   2019-06-17
 * @Version: V1.0
 */
@Data
@TableName("orders_waybills")
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="orders_waybills对象", description="订单运单关联表")
public class OrdersWaybills {
    
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
	/**运单与订单关联表id*/
	@TableId(type = IdType.UUID)
    @ApiModelProperty(value = "运单与订单关联表id")
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
	/**运单表编号*/
	@Excel(name = "运单表编号", width = 15)
    @ApiModelProperty(value = "运单表编号")
	private java.lang.String waybillsId;
}
