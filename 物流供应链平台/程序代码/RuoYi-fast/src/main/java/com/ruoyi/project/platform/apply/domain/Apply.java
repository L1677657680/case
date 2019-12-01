package com.ruoyi.project.platform.apply.domain;

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
 * @Description: 申请表
 * @Date:   2019-06-13
 * @Version: V1.0
 */
@Data
@TableName("apply")
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="apply对象", description="申请表")
public class Apply {
    
	/**申请订单编号*/
	@Excel(name = "申请订单编号", width = 15)
    @ApiModelProperty(value = "申请订单编号")
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
	/**申请订单id*/
	@TableId(type = IdType.UUID)
    @ApiModelProperty(value = "申请订单id")
	private java.lang.String id;
	/**申请信息，成功或是失败的反馈信息*/
	@Excel(name = "申请信息，成功或是失败的反馈信息", width = 15)
    @ApiModelProperty(value = "申请信息，成功或是失败的反馈信息")
	private java.lang.String info;
	/**放款账号*/
	@Excel(name = "放款账号", width = 15)
    @ApiModelProperty(value = "放款账号")
	private java.lang.String loanAccount;
	/**放款时间*/
	@Excel(name = "放款时间", width = 20, dateFormat = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "放款时间")
	private java.util.Date loanTime;
	/**状态 0-已融资放款 1-正在申请 2-待审核 3-不合规则 4-待确认签章 5-审批不通过 6-已签章 7-待放款 8-不予放款 9-待撤销签章 10-已撤销*/
	@Excel(name = "状态", width = 15,readConverterExp="0=已融资放款,1=正在申请,2=待审核,3=不合规则,4=待确认签章,5=审批不通过,6=已签章,7=待放款,8=不予放款,9=待撤销签章,10=已撤销")
    @ApiModelProperty(value = "状态")
	private java.lang.String status;
	/**保理金额*/
	@Excel(name = "保理金额", width = 15)
    @ApiModelProperty(value = "保理金额")
	private java.math.BigDecimal factoringSum;
	/**申请金额*/
	@Excel(name = "申请金额", width = 15)
    @ApiModelProperty(value = "申请金额")
	private java.math.BigDecimal sum;
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
	
	/**融资机构*/
	@Excel(name = "融资机构", width = 20)
    @ApiModelProperty(value = "融资机构")
	private java.lang.String bankId;
	
	/**融资机构名称*/
	@Excel(name = "融资机构名称", width = 20)
    @ApiModelProperty(value = "融资机构名称")
	private java.lang.String bankName;
	/**托运方*/
	@Excel(name = "托运方", width = 20)
    @ApiModelProperty(value = "托运方")
	private java.lang.String shipper;
	/**物流企业*/
	@Excel(name = "物流企业", width = 20)
    @ApiModelProperty(value = "物流企业")
	private java.lang.String carrier;
	/**户名*/
	@Excel(name = "户名", width = 20)
    @ApiModelProperty(value = "户名")
	private java.lang.String accountName;
	/**开户行*/
	@Excel(name = "开户行", width = 20)
    @ApiModelProperty(value = "开户行")
	private java.lang.String openBank;
	
	/** 申请表对应订单列表 */
	@ApiModelProperty(value = "订单列表-一对多")
	@TableField(exist = false)
	private java.util.List<Orders> ordersList;
	
}
