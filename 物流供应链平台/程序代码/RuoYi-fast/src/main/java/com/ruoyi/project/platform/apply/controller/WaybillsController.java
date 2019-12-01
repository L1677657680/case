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
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.platform.apply.domain.Orders;
import com.ruoyi.project.platform.apply.domain.Waybills;
import com.ruoyi.project.platform.apply.service.IOrdersService;
import com.ruoyi.project.platform.apply.service.IWaybillsService;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 运单信息操作处理
 * 
 * @author ruoyi
 * @date 2019-06-24
 */
@Controller
@RequestMapping("/apply/waybills")
public class WaybillsController extends BaseController
{
    private String prefix = "platform/waybills";
	
	@Autowired
	private IWaybillsService waybillsService;
	@Autowired
	private IOrdersService ordersService;
	
	@RequiresPermissions("platform:waybills:view")
	@GetMapping()
	public String waybills()
	{
	    return prefix + "/waybills";
	}
	
	/**
	 * 查询运单列表
	 */
	@RequiresPermissions("platform:waybills:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Waybills waybills)
	{
		startPage();
        QueryWrapper<Waybills> queryWrapper = new QueryWrapper<Waybills>(waybills);
        List<Waybills> list = waybillsService.list(queryWrapper);
		return getDataTable(list);
	}
	
	/**
	 * 查询运单列表
	 */
	//@RequiresPermissions("platform:waybills:list")
	@PostMapping("/listByOrdersId")
	@ResponseBody
	public TableDataInfo listByOrdersId(String ordersId)
	{
		startPage();
        List<Waybills> list = waybillsService.selectListByOrdersId(ordersId);
		return getDataTable(list);
	}
	
	/**
	 * 运单详情
	 */
	@RequiresPermissions("platform:waybills:detail")
    @GetMapping("/detail/{waybillsId}")
    public String detail(@PathVariable("waybillsId") String waybillsId, ModelMap mmap)
    {
		Waybills waybills = waybillsService.getById(waybillsId);
        mmap.put("waybills", waybills);
        // 同时查出对应的订单数据
        QueryWrapper<Orders> queryWrapper = new QueryWrapper<Orders>();
        queryWrapper.eq("ow.waybills_id", waybills.getId());
        mmap.put("orders", ordersService.selectOrdersByOrdersWaybills(queryWrapper));
        return prefix + "/detail";
    }
	
	/**
	 * 导出运单列表
	 */
	@RequiresPermissions("platform:waybills:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Waybills waybills)
    {
    	QueryWrapper<Waybills> queryWrapper = new QueryWrapper<Waybills>(waybills);
		List<Waybills> list = waybillsService.list(queryWrapper);
        ExcelUtil<Waybills> util = new ExcelUtil<Waybills>(Waybills.class);
        return util.exportExcel(list, "waybills");
    }
	
	
}
