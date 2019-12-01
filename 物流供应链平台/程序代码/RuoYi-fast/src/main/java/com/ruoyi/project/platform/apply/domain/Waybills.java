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
 * @Description: 运单表
 * @Date:   2019-06-13
 * @Version: V1.0
 */
@Data
@TableName("waybills")
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="waybills对象", description="运单表")
public class Waybills {
    
	/**运单号*/
	@Excel(name = "运单号", width = 15)
    @ApiModelProperty(value = "运单号")
	private java.lang.String number;
	/**司机*/
	@Excel(name = "司机", width = 15)
    @ApiModelProperty(value = "司机")
	private java.lang.String driverName;
	/**车牌*/
	@Excel(name = "车牌", width = 15)
    @ApiModelProperty(value = "车牌")
	private java.lang.String carVno;
	/**单价*/
	@Excel(name = "单价", width = 15)
    @ApiModelProperty(value = "单价")
	private java.math.BigDecimal price;
	/**运单应收费用*/
	@Excel(name = "运单应收费用", width = 15)
    @ApiModelProperty(value = "运单应收费用")
	private java.math.BigDecimal cost;
	/**装货量*/
	@Excel(name = "装货量", width = 15)
    @ApiModelProperty(value = "装货量")
	private java.math.BigDecimal actualCount;
	/**到货量*/
	@Excel(name = "到货量", width = 15)
    @ApiModelProperty(value = "到货量")
	private java.math.BigDecimal backCount;
	/**到货时间 格式 yyyy-MM-dd HH:mm:ss 没到货该字段为-*/
	@Excel(name = "到货时间", width = 15)
    @ApiModelProperty(value = "到货时间 格式 yyyy-MM-dd HH:mm:ss 没到货该字段为-")
	private java.lang.String arrivalDate;
	/**装货时间 格式 yyyy-MM-dd HH:mm:ss 没装货该字段为-*/
	@Excel(name = "装货时间", width = 15)
    @ApiModelProperty(value = "装货时间 格式 yyyy-MM-dd HH:mm:ss 没装货该字段为-")
	private java.lang.String loadDate;
	/**运单状态 已接单, 已装货, 运输中, 到货交付, 已回单, 已结算*/
	@Excel(name = "运单状态", width = 15)
    @ApiModelProperty(value = "运单状态 已接单, 已装货, 运输中, 到货交付, 已回单, 已结算")
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
	/**运单id*/
	@TableId(type = IdType.UUID)
    @ApiModelProperty(value = "运单id")
	private java.lang.String id;
	
}
