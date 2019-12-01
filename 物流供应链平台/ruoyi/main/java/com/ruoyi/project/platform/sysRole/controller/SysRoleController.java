package com.ruoyi.project.platform.sysRole.controller;

import java.util.Arrays;
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
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.platform.sysRole.domain.SysRole;
import com.ruoyi.project.platform.sysRole.service.ISysRoleService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.text.Convert;

/**
 * 角色信息操作处理
 * 
 * @author 
 * @date 2019-07-11
 */
@Controller
@RequestMapping("/platform/sysRole")
public class SysRoleController extends BaseController
{
    private String prefix = "platform/sysRole";
	
	@Autowired
	private ISysRoleService sysRoleService;
	
	@RequiresPermissions("platform:sysRole:view")
	@GetMapping()
	public String sysRole()
	{
	    return prefix + "/sysRole";
	}
	
	/**
	 * 查询角色列表
	 */
	@RequiresPermissions("platform:sysRole:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(SysRole sysRole)
	{
		startPage();
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<SysRole>(sysRole);
		List<SysRole> list = sysRoleService.list(queryWrapper);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出角色列表
	 */
	@RequiresPermissions("platform:sysRole:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysRole sysRole)
    {
    	QueryWrapper<SysRole> queryWrapper = new QueryWrapper<SysRole>(sysRole);
		List<SysRole> list = sysRoleService.list(queryWrapper);
        ExcelUtil<SysRole> util = new ExcelUtil<SysRole>(SysRole.class);
        return util.exportExcel(list, "sysRole");
    }
	
	/**
	 * 新增角色
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存角色
	 */
	@RequiresPermissions("platform:sysRole:add")
	@Log(title = "角色", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(SysRole sysRole)
	{		
		return toAjax(sysRoleService.save(sysRole) ? 1 : 0);
	}

	/**
	 * 修改角色
	 */
	@GetMapping("/edit/{roleId}")
	public String edit(@PathVariable("roleId") Long roleId, ModelMap mmap)
	{
		SysRole sysRole = sysRoleService.getById(roleId);
		mmap.put("sysRole", sysRole);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存角色
	 */
	@RequiresPermissions("platform:sysRole:edit")
	@Log(title = "角色", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(SysRole sysRole)
	{	
		return toAjax(sysRoleService.updateById(sysRole)? 1 : 0);
	}
	
	/**
	 * 删除角色
	 */
	@RequiresPermissions("platform:sysRole:remove")
	@Log(title = "角色", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{	
		List<Integer> lst = Arrays.asList(Convert.toIntArray(ids));	
		return toAjax(sysRoleService.removeByIds(lst)? 1 : 0);
	}
	
}
