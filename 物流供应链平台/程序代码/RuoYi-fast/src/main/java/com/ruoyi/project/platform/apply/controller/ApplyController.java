package com.ruoyi.project.platform.apply.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.platform.apply.domain.Apply;
import com.ruoyi.project.platform.apply.domain.ApplyOrders;
import com.ruoyi.project.platform.apply.domain.Orders;
import com.ruoyi.project.platform.apply.domain.OrdersWaybills;
import com.ruoyi.project.platform.apply.domain.Waybills;
import com.ruoyi.project.platform.apply.service.IApplyOrdersService;
import com.ruoyi.project.platform.apply.service.IApplyService;
import com.ruoyi.project.platform.apply.service.IOrdersService;
import com.ruoyi.project.platform.apply.service.IOrdersWaybillsService;
import com.ruoyi.project.platform.apply.service.IWaybillsService;
import com.ruoyi.project.platform.apply.util.ApplyUtil;

import io.swagger.annotations.ApiOperation;

import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.common.utils.text.Convert;

/**
 * 申请订单信息操作处理
 * 
 * @date 2019-06-21
 */
@Controller
@RequestMapping("/apply")
public class ApplyController extends BaseController
{
    private String prefix = "platform/apply";
	
	@Autowired
	private IApplyService applyService;
	@Autowired
	private IOrdersService ordersService;// 订单服务接口
	@Autowired
	private IWaybillsService waybillsService;// 运单服务接口
	@Autowired
	private IApplyOrdersService applyOrdersService;// 申请表与订单表中间关联服务接口
	@Autowired
	private IOrdersWaybillsService ordersWaybillsService;// 运单表与订单表中间关联服务接口
	
	@RequiresPermissions("platform:apply:view")
	@GetMapping()
	public String apply()
	{
	    return prefix + "/apply";
	}
	
	@RequiresPermissions("platform:apply:checkview")
	@GetMapping("/check")
	public String applyCheck()
	{
	    return prefix + "/applyCheck";
	}
	
	/**
	 * 查询申请订单列表
	 */
	@RequiresPermissions("platform:apply:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Apply apply)
	{
		startPage();
        QueryWrapper<Apply> queryWrapper = new QueryWrapper<Apply>(apply);
        List<Apply> list = applyService.list(queryWrapper);
		return getDataTable(list);
	}
		
	/**
	 * 当前用户的审核申请,只能查询到当前用户的部门的审核申请
	 */
	@RequiresPermissions("platform:apply:checklist")
	@PostMapping("/checkList")
	@ResponseBody
	public TableDataInfo checkList(Apply apply)
	{	
		// 获取当前的用户信息 
		Long useId = ShiroUtils.getUserId();
		startPage();
		// mybatis-plus条件构造器,使用可以查看官方文档
        QueryWrapper<Apply> queryWrapper = new QueryWrapper<Apply>();
        queryWrapper.eq("ur.user_id", useId);// 等价于: ur.user_id = 100 
        // 因为自定义了语句,原本的条件查询参数字段不符,需要自行判断筛选的条件
        if(apply.getCarrier() != null && apply.getCarrier().length() > 0) {// carrier 物流企业
        	queryWrapper.like("a.carrier", apply.getCarrier());// 等价于: a.carrier like %xxx%
        }
        if(apply.getApplyId() != null && apply.getApplyId().length() > 0) {// 申请编号
        	queryWrapper.eq("a.apply_id", apply.getApplyId());// 等价于: a.apply_id = xxx
        }
        if(apply.getStatus() != null && apply.getStatus().length() > 0) {// 申请编号
        	queryWrapper.eq("a.status", apply.getStatus());// 等价于: a.status = xxx
        }
        List<Apply> list = applyService.selectApplyByDeptRoleUser(queryWrapper);
		return getDataTable(list);
	}
	
	/**
	 * 修改申请状态
	 */
	@PostMapping("/passOrTurn")
	@ResponseBody
	public Map<String, Object> passOrTurn(Apply apply,String type)
	{	
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code",0);
		if("2".equals(apply.getStatus())) {
			apply.setUpdateBy(ShiroUtils.getLoginName());
			apply.setUpdateTime(new Date());
			if("0".equals(type)) {//通过
				result.put("msg","通过成功");
				apply.setStatus("4");
				applyService.updateById(apply);
			}else if("1".equals(type)) {// 驳回
				apply.setStatus("5");
				applyService.updateById(apply);
				result.put("msg","驳回成功");
			}else {
				result.put("code",1);
				result.put("msg","状态异常");
			}
		}else {
			result.put("code",1);
			result.put("msg","只能审批状态为待审核的申请单");
		}
		return result;
	    
	}
	
	/**
	 * 导出申请订单列表
	 */
	@RequiresPermissions("platform:apply:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Apply apply)
    {
    	QueryWrapper<Apply> queryWrapper = new QueryWrapper<Apply>(apply);
		List<Apply> list = applyService.list(queryWrapper);
        ExcelUtil<Apply> util = new ExcelUtil<Apply>(Apply.class);
        return util.exportExcel(list, "apply");
    }
	
	/**
	 * 新增保存申请订单
	 */
	@RequiresPermissions("platform:apply:add")
	@Log(title = "申请订单", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Apply apply)
	{		
		return toAjax(applyService.save(apply) ? 1 : 0);
	}

	/**
	 * 修改申请订单
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") String id, ModelMap mmap)
	{
		Apply apply = applyService.getById(id);
		mmap.put("apply", apply);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存申请订单
	 */
	@RequiresPermissions("platform:apply:edit")
	@Log(title = "申请订单", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Apply apply)
	{	
		return toAjax(applyService.updateById(apply)? 1 : 0);
	}
	
	/**
	 * 删除申请订单
	 */
	@RequiresPermissions("platform:apply:remove")
	@Log(title = "申请订单", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{	
		List<Integer> lst = Arrays.asList(Convert.toIntArray(ids));	
		return toAjax(applyService.removeByIds(lst)? 1 : 0);
	}
	
	/**
	 * 申请订单详情
	 */
	@RequiresPermissions("platform:apply:detail")
    @GetMapping("/detail/{applyId}")
    public String detail(@PathVariable("applyId") String applyId, ModelMap mmap)
    {
        mmap.put("apply", applyService.getById(applyId));
        return prefix + "/detail";
    }
	
	/**
	 * 下载文档
	 */
	@ApiOperation(value="申请表-下载文档", notes="申请表-下载文档")
	@GetMapping("/downloadFile/{id}/{type}")
	public void downloadFile(@PathVariable("id") String id,@PathVariable("type") String type, HttpServletResponse response,
	        HttpServletRequest request) throws Exception
	{
		Apply apply = applyService.getById(id);
		QueryWrapper<Orders> queryWrapper = new QueryWrapper<Orders>();
	    queryWrapper.eq("ao.apply_id", apply.getApplyId());
	    List<Orders> list = ordersService.selectOrdersByApplyOrders(queryWrapper);
	    apply.setOrdersList(list);
		String[] fileNameArr = {"1","2"};
		String fileName = "";
		if("1".equals(type)) {
			fileName = fileNameArr[0];
		}else {
			fileName = fileNameArr[1];
		}
		String[] path_FileName = ApplyUtil.createWord(fileName, apply,type);
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition",
				"attachment;fileName=" + FileUtils.setFileDownloadHeader(request, path_FileName[1]));
		FileUtils.writeBytes(path_FileName[0] + path_FileName[1], response.getOutputStream());
	}
	
	/**
	 * 行好运网提交申请,返回一个页面视图，并渲染数据至页面
	 * @param apply
	 * @return
	 */
	@Log(title = "申请表-行好运网提交申请-跳转页面", businessType = BusinessType.OTHER,isSaveRequestData = false)
	@ApiOperation(value="申请表-行好运网提交申请-跳转页面", notes="申请表-行好运网提交申请-跳转页面")
	@PostMapping(value = "/present")
	public ModelAndView present(String value) {
		ModelAndView mv = new ModelAndView();
		Apply apply = null;
		mv.setViewName(prefix + "/confirm");// 申请确认页面
		StringBuffer ordersId = new StringBuffer();
		StringBuffer wIds = new StringBuffer();
		try {
		    apply = processData(value);
		    /** 获取到数据进行格式化处理之后的添加处理 */
			// 数据sql插入去重,捕捉主键约束异常即为已存在>进行修改 
			if(apply.getOrdersList() != null && apply.getOrdersList().size() > 0) {
				// 保存订单数据
				for(int i=0;i<apply.getOrdersList().size();i++) {
					try {
						ordersService.save(apply.getOrdersList().get(i));
						ordersId.append(apply.getOrdersList().get(i).getId()).append(",");
						// 保存订单与申请单的关联信息
					}catch (DuplicateKeyException e) {
						ordersId.append(apply.getOrdersList().get(i).getId()).append(",");
						ordersService.updateById(apply.getOrdersList().get(i));
					}
					// 保存运单数据
					for(int j=0;j<apply.getOrdersList().get(i).getWaybillsList().size();j++) {
						wIds.append(apply.getOrdersList().get(i).getWaybillsList().get(j).getId()).append(",");
						try {
							waybillsService.save(apply.getOrdersList().get(i).getWaybillsList().get(j));
							OrdersWaybills ordersWaybills = new OrdersWaybills();
							ordersWaybills.setOrdersId(apply.getOrdersList().get(i).getId());
							ordersWaybills.setWaybillsId(apply.getOrdersList().get(i).getWaybillsList().get(j).getId());
							ordersWaybillsService.save(ordersWaybills);
						}catch (DuplicateKeyException e) {
							waybillsService.updateById(apply.getOrdersList().get(i).getWaybillsList().get(j));
						}
					}
				}
			}
			// 条件构造器 - 查询当前运单的保理金额
			QueryWrapper<Apply> queryWrapper = new QueryWrapper<Apply>();
			Object[] wIdss = wIds.deleteCharAt(wIds.length() - 1).toString().split(",");
			queryWrapper.in("w.id", wIdss);
			BigDecimal sum = applyService.getSumByApplyId(queryWrapper, "0.9");
			apply.setSum(sum);
		    mv.addObject("ordersIds",ordersId.deleteCharAt(ordersId.length() - 1).toString());
		    mv.addObject("apply", apply);
		}catch (NullPointerException e) {
			mv.addObject("msg", "数据为空");
			mv.setViewName("error/501");// 异常页面
		}catch (Exception e) {
			mv.addObject("msg", "数据错误，解析异常");
			mv.setViewName("error/501");// 异常页面
			e.printStackTrace();
		}
		return mv;
	}
	
	
	/**
	 * 	处理行好运网传来的数据
	 * @param json 传过来的json字符串
	 * @return
	 * @throws Exception 
	 */
	public Apply processData(String jsonStr) throws Exception {
		Apply apply = new Apply();
		if(jsonStr != null && jsonStr.length() > 0) {
			List<Orders> ordersList = new ArrayList<Orders>();
			jsonStr = URLDecoder.decode(jsonStr, "UTF-8");// 解码
			jsonStr = URLDecoder.decode(jsonStr, "UTF-8");// 解码
			// 判断字符串是否存在'"' 双引号 ,去掉引号 转换 json对象
			if("\"".equals(jsonStr.substring(jsonStr.length()-1,jsonStr.length())) && "\"".equals(jsonStr.substring(0,1))) {
				jsonStr = jsonStr.substring(1, jsonStr.length()-1);
			}
			JSONObject json = JSONObject.parseObject(jsonStr);	
			if(json != null) {
				apply.setApplyId(json.getString("apply_id"));
				if(json.getString("orders") != null && json.getString("orders").length() > 0) {
					JSONArray jsonArray = JSONArray.parseArray(json.getString("orders"));
					apply.setShipper(jsonArray.getJSONObject(0).getString("shipper_name"));
					apply.setCarrier(jsonArray.getJSONObject(0).getString("carrier_name"));
					for(int i = 0; i < jsonArray.size(); i++) {
						Orders orders = new Orders();
						orders.setId(jsonArray.getJSONObject(i).getString("id"));
						orders.setNumber(jsonArray.getJSONObject(i).getString("number"));// 订单号
						orders.setCarrierLicenseNumber(jsonArray.getJSONObject(i).getString("carrier_license_number"));//承运人营业执照
						orders.setCarrierName(jsonArray.getJSONObject(i).getString("carrier_name"));// 承运人名称
						orders.setShipperName(jsonArray.getJSONObject(i).getString("shipper_name"));// 托运人名称
						orders.setStartArea(jsonArray.getJSONObject(i).getString("start_area"));// 起点
						orders.setEndArea(jsonArray.getJSONObject(i).getString("end_area"));// 终点
						orders.setCount(new BigDecimal(jsonArray.getJSONObject(i).getString("count")));// 订单量
						orders.setProductName(jsonArray.getJSONObject(i).getString("product_name"));// 货物名称
						orders.setContractNumber(jsonArray.getJSONObject(i).getString("contract_number"));// 合同编号
						orders.setCost(new BigDecimal(jsonArray.getJSONObject(i).getString("cost")));// 订单应收费用
						orders.setStatus(jsonArray.getJSONObject(i).getString("status"));// 订单状态
						orders.setArrivalCount(new BigDecimal(jsonArray.getJSONObject(i).getString("arrival_count")));// 运输完成量
						orders.setNoTransportCount(new BigDecimal(jsonArray.getJSONObject(i).getString("no_transport_count")));// 未运输量
						if(jsonArray.getJSONObject(i).getString("waybills") != null && jsonArray.getJSONObject(i).getString("waybills").length() > 0) {
							JSONArray jsonArray2 = JSONArray.parseArray(jsonArray.getJSONObject(i).getString("waybills"));
							List<Waybills> waybillsList = new ArrayList<Waybills>();
							for(int j = 0; j < jsonArray2.size(); j++) {
								Waybills waybills = new Waybills();
								waybills.setId(jsonArray2.getJSONObject(j).getString("id"));
								waybills.setNumber(jsonArray2.getJSONObject(j).getString("number"));// 运单号
								waybills.setActualCount(new BigDecimal(jsonArray2.getJSONObject(j).getString("actual_count")));// 装货量
								waybills.setBackCount(new BigDecimal(jsonArray2.getJSONObject(j).getString("back_count")));// 到货量
								waybills.setDriverName(jsonArray2.getJSONObject(j).getString("driver_name"));// 司机
								waybills.setCarVno(jsonArray2.getJSONObject(j).getString("car_vno"));// 车牌
								waybills.setPrice(new BigDecimal(jsonArray2.getJSONObject(j).getString("price")));// 单价
								waybills.setCost(new BigDecimal(jsonArray2.getJSONObject(j).getString("cost")));// 运单应收费用
								waybills.setLoadDate(jsonArray2.getJSONObject(j).getString("load_date"));// 装货时间
								waybills.setArrivalDate(jsonArray2.getJSONObject(j).getString("arrival_date"));// 到货时间
								waybills.setStatus(jsonArray2.getJSONObject(j).getString("status"));// 状态
								waybillsList.add(waybills);
							}
							orders.setWaybillsList(waybillsList);
						}
						ordersList.add(orders);
					}
					apply.setInfo("请及时确认");
					apply.setStatus("1");
					apply.setOrdersList(ordersList);
				}
			}
		}else {
			throw new NullPointerException();
		}
		return apply;
	}
	
	/**
	 * 确认申请
	 * @param apply
	 * @return
	 */
	@ApiOperation(value="申请表-确认申请", notes="申请表-确认申请")
	@PostMapping(value = "/confirmApply")
	public ModelAndView confirmApply(Apply apply,String ordersIds) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/502");
		//0-已融资放款 1-正在申请 2-待审核 3-不合规则 4-待确认签章 5-审批不通过 6-已签章 7-待放款 8-不予放款 9-待撤销签章 10-已撤销
		if(apply.getApplyId() != null && apply.getApplyId().length() > 0) {
			if(ordersIds != null && ordersIds.length() > 0) {
				Object[] ids = ordersIds.split(",");
				QueryWrapper<Apply> queryWrapper = new QueryWrapper<Apply>();
				queryWrapper.in("o.id", ids);
				// 查询订单编号对应的申请单是否存在
				int count = applyService.selectApplyCountByOrdersIds(queryWrapper);
				if(count < 1) {
					List<ApplyOrders> list = new ArrayList<ApplyOrders>();
					for(int i=0;i<ids.length;i++) {
						ApplyOrders applyOrders = new ApplyOrders();
						applyOrders.setApplyId(apply.getApplyId());
						applyOrders.setOrdersId(ids[i].toString());
						list.add(applyOrders);
					}
					applyOrdersService.saveBatch(list);
					// 根据保理金额90%计算总额  (sum / 9) + sum = 总额  -余4位向上取整
					BigDecimal num = apply.getFactoringSum().divide(new BigDecimal(9),4,RoundingMode.HALF_UP);
				    apply.setFactoringSum(apply.getFactoringSum().add(num));
			        apply.setCreateBy(apply.getCarrier());
			        apply.setCreateTime(new Date());
					apply.setStatus("2");
					applyService.save(apply);
					mv.setViewName(prefix + "/wizard");
				}else {
					mv.addObject("msg", "申请订单已经存在");
				}
			}else {
				mv.addObject("msg", "订单编号为空");
			}
		}else {
			mv.addObject("msg", "申请编号为空");
		}
		return mv;
	}
	
}
