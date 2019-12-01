package com.ruoyi.project.platform.apply.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.platform.apply.domain.Orders;
import com.ruoyi.project.platform.apply.service.IOrdersService;

import io.swagger.annotations.ApiOperation;

import com.ruoyi.framework.web.domain.AjaxResult;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

/**
 * 订单信息操作处理
 * 
 * @date 2019-06-24
 */
@Controller
@RequestMapping("/apply/orders")
public class OrdersController extends BaseController
{
    private String prefix = "platform/orders";
	
	@Autowired
	private IOrdersService ordersService;
	
	@RequiresPermissions("platform:orders:view")
	@GetMapping()
	public String orders()
	{
	    return prefix + "/orders";
	}
	
	/**
	 * 查询订单列表
	 */
	@RequiresPermissions("platform:orders:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Orders orders)
	{
		startPage();
        QueryWrapper<Orders> queryWrapper = new QueryWrapper<Orders>(orders);
		List<Orders> list = ordersService.list(queryWrapper);
		return getDataTable(list);
	}
	
	/**
	 * 查询订单列表
	 */
	//@RequiresPermissions("platform:orders:list")
	@PostMapping("/ordersListByApplyId")
	@ResponseBody
	public TableDataInfo ordersListByApplyId(String applyId)
	{
		startPage();
        QueryWrapper<Orders> queryWrapper = new QueryWrapper<Orders>();
        queryWrapper.eq("ao.apply_id", applyId);
		List<Orders> list = ordersService.selectOrdersByApplyOrders(queryWrapper);
		return getDataTable(list);
	}
	
	/**
	 * 根据订单ids 查询订单列表
	 * @param ordersIds 订单id字符串 x,x,x,x,x,x
	 * @return
	 */
	//@RequiresPermissions("platform:orders:list")
	@PostMapping("/ordersListByOrdersIds")
	@ResponseBody
	public TableDataInfo ordersListByOrdersIds(String ordersIds)
	{
		startPage();
        QueryWrapper<Orders> queryWrapper = new QueryWrapper<Orders>();
        queryWrapper.in("id", ordersIds);
		List<Orders> list = ordersService.list(queryWrapper);
		return getDataTable(list);
	}
	
	
	/**
	 * 订单详情
	 */
	@ApiOperation(value="订单表-详情", notes="订单表-详情")
	@RequiresPermissions("platform:orders:detail")
    @GetMapping("/detail/{ordersId}")
    public String detail(@PathVariable("ordersId") String ordersId, ModelMap mmap)
    {
        mmap.put("orders", ordersService.getById(ordersId));
        return prefix + "/detail";
    }
	
	/**
	 * 导出订单列表
	 */
	@RequiresPermissions("platform:orders:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Orders orders)
    {
    	QueryWrapper<Orders> queryWrapper = new QueryWrapper<Orders>(orders);
		List<Orders> list = ordersService.list(queryWrapper);
        ExcelUtil<Orders> util = new ExcelUtil<Orders>(Orders.class);
        return util.exportExcel(list, "orders");
    }
	
}
