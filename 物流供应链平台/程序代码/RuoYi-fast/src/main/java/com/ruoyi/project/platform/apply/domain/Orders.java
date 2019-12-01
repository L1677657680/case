package com.ruoyi.project.platform.apply.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

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
 * @Description: 订单表
 * @Date:   2019-06-13
 * @Version: V1.0
 */
@Data
@TableName("orders")
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="orders对象", description="订单表")
public class Orders {
    
	/**订单编号*/
	@TableId(type = IdType.UUID)
    @ApiModelProperty(value = "订单编号")
	private java.lang.String id;
	/**订单号*/
	@Excel(name = "订单号", width = 15)
    @ApiModelProperty(value = "订单号")
	private java.lang.String number;
	/**合同编号*/
	@Excel(name = "合同编号", width = 15)
    @ApiModelProperty(value = "合同编号")
	private java.lang.String contractNumber;
	/**承运人营业执照*/
	@Excel(name = "承运人营业执照", width = 15)
	@ApiModelProperty(value = "承运人营业执照")
	private java.lang.String carrierLicenseNumber;
	/**运输完成量*/
	@Excel(name = "运输完成量", width = 15)
    @ApiModelProperty(value = "运输完成量")
	private java.math.BigDecimal arrivalCount;
	/**承运人名称*/
	@Excel(name = "承运人名称", width = 15)
    @ApiModelProperty(value = "承运人名称")
	private java.lang.String carrierName;
	/**托运人名称*/
	@Excel(name = "托运人名称", width = 15)
    @ApiModelProperty(value = "托运人名称")
	private java.lang.String shipperName;
	/**订单应收费用*/
	@Excel(name = "订单应收费用", width = 15)
    @ApiModelProperty(value = "订单应收费用")
	private java.math.BigDecimal cost;
	/**起点*/
	@Excel(name = "起点", width = 15)
    @ApiModelProperty(value = "起点")
	private java.lang.String startArea;
	/**终点*/
	@Excel(name = "终点", width = 15)
    @ApiModelProperty(value = "终点")
	private java.lang.String endArea;
	/**货物名称*/
	@Excel(name = "货物名称", width = 15)
    @ApiModelProperty(value = "货物名称")
	private java.lang.String productName;
	/**订单量*/
	@Excel(name = "订单量", width = 15)
    @ApiModelProperty(value = "订单量")
	private java.math.BigDecimal count;
	/**未完成量*/
	@Excel(name = "未完成量", width = 15)
    @ApiModelProperty(value = "未完成量")
	private java.math.BigDecimal noTransportCount;
	/**状态 新订单, 已完成, 已作废, 异常订单, 调度中*/
	@Excel(name = "状态", width = 15)
    @ApiModelProperty(value = "状态")
	private java.lang.String status;
	/**修改人*/
    @ApiModelProperty(value = "修改人")
	private java.lang.String updateBy;
	/**修改时间*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "修改时间")
	private java.util.Date updateTime;
	/**创建人*/
    @ApiModelProperty(value = "创建人")
	private java.lang.String createBy;
	/**创建时间*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "创建时间")
	private java.util.Date createTime;
	
	/** 运单列表 */
	@ApiModelProperty(value = "运单列表-一对多")
	@TableField(exist = false)
	private List<Waybills> waybillsList;
}
