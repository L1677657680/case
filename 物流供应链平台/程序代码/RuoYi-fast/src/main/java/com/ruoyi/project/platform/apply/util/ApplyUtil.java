package com.ruoyi.project.platform.apply.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.xwpf.usermodel.XWPFDocument;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.project.platform.apply.domain.Apply;

import cn.afterturn.easypoi.word.WordExportUtil;
import cn.hutool.http.HttpUtil;

/**
 * 申请单 工具类
 */
public class ApplyUtil {
	
	/**
	 * 生成模板文档 -使用easy-poi插件作word导出-可以搜索官方文档了解使用方式
	 * @param fileName 文件名字
	 * @param path 路径
	 * @param apply 申请数据
	 * @return
	 */
	public static String[] createWord(String fileName,Apply apply,String type){
		String wordPath = "";// 生成文档的文件位置
		String templatePathStr = "";// 模板的文件位置
		// 判断系统是否运行在windows
		// liunx 系统与 window 系统的文件目录有差别
		if (System.getProperties().getProperty("os.name").contains("Windows")) {
			templatePathStr = "D:/home/host/royi/template/";// 文件夹路径 
			wordPath = "D:/home/host/royi/word/";// 文件夹路径  
        }else {
        	wordPath = "/home/host/royi/word/";// 文件夹路径  
        	templatePathStr = "/home/host/royi/template/";// 文件夹路径  
        }
		String[] fileUploadName = new String[2];
        File myPath = new File(wordPath);  
        if (!myPath.exists()){//若此目录不存在，则创建
            myPath.mkdirs();  
        }  
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
        String dateTime = LocalDateTime.now(ZoneOffset.of("+8")).format(formatter);
        
		String[] fileNameArr = {"应收账款转让申请及确认书","应收账款转让通知书"};
		String fileName2 = "";
		if("1".equals(type)) {// 根据类型判断当前要下载的文档
			fileName2 = fileNameArr[0];
		}else {
			fileName2 = fileNameArr[1];
		}
        String modelName = fileName2 + "-" + dateTime + ".docx";
        // notBlank为一个空格字符,生成模板时如果数据为空会在生成模板的占位符位置显示异常字符,需要把将要填充的内容为空的替换为 一个空格字符
        // 因为测试写,没有做优化的缘故,可以优化修改填充字符的方式: 当前为每一个属性都用三目运算判断填充
        String notBlank= " ";
        Map<String, Object> datas = new HashMap<String, Object>();
        datas.put("bankName",apply.getBankName() != null && apply.getBankName().length() > 0?apply.getBankName():notBlank);// 融资机构
        datas.put("shipper",apply.getShipper() != null && apply.getShipper().length() > 0?apply.getShipper():notBlank);// 托运方
        datas.put("carrier",apply.getCarrier() != null && apply.getCarrier().length() > 0?apply.getCarrier():notBlank);// 物流企业
        datas.put("loanAccount",apply.getLoanAccount() != null && apply.getLoanAccount().length() > 0?apply.getLoanAccount():notBlank);// 银行账户
        datas.put("accountName",apply.getAccountName() != null && apply.getAccountName().length() > 0?apply.getAccountName():notBlank);// 户名
        datas.put("openBank",apply.getOpenBank() != null && apply.getOpenBank().length() > 0?apply.getOpenBank():notBlank);// 开户行
        datas.put("factoringSum",apply.getFactoringSum() != null?apply.getFactoringSum():notBlank);// 金额
        datas.put("sum",apply.getSum() != null?apply.getSum():notBlank);// 金额
          // 转让确认书中的列表,合同编号发票号等信息,因为订单数据是否都是一个合同存有疑议,需要了解生成规则才能生成列表数据
//        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
//        for(int i=0;i<apply.getOrdersList().size();i++) {
//        	Map<String,Object> map = new HashMap<String,Object>();
//        	map.put("index",i+1);// 序号
//        	map.put("purchaser",apply.getBankName() != null && apply.getBankName().length() > 0?apply.getBankName():notBlank);// 买方
//        	map.put("contractNumber",apply.getOrdersList().get(i).getContractNumber()!=null && apply.getOrdersList().get(i).getContractNumber().length() >0?apply.getOrdersList().get(i).getContractNumber():notBlank);// 合同编号
//        	map.put("accountType"," ");// 账款种类
//        	map.put("sum",apply.getSum() != null?apply.getSum():notBlank);// 金额
//        	map.put("expiringDate"," ");// 到期日
//        	map.put("invoiceNumber"," ");// 发票号
//        	map.put("invoiceSum"," ");// 发票金额
//        	map.put("invoiceDate"," ");// 发票开具日
//        	list.add(map);
//        	break;
//        }
//        datas.put("list",list);
        FileOutputStream out;
        try {
        	File file = new File(templatePathStr+ fileName +".docx");
        	//ClassPathResource classPathResource = new ClassPathResource("word/" + fileName +".docx");
        	XWPFDocument doc = WordExportUtil.exportWord07(
        			file.getPath(), datas);
            out = new FileOutputStream(wordPath+modelName);
            doc.write(out);
            out.flush();
            out.close();
            fileUploadName[0] =  wordPath;
            fileUploadName[1] = modelName;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
		return fileUploadName;
	}
	
	/**
	 * 发送申请单状态数据至行好运网同步
	 * @param applyId 申请编号
	 * @param status 状态
	 * @param statusText 状态文本
	 * @return
	 */
	public boolean sendStatus(String applyId,String status,String statusText) {
		HashMap<String, Object> paramMap = new HashMap<>();
		boolean is = false;
		String url = "http://10.65.0.9:19626/apply/test";
		if(applyId != null && applyId.length() > 0) {
			paramMap.put("applyId", applyId);
		}
		if(status != null && status.length() > 0) {
			paramMap.put("status", status);
		}
		if(statusText != null && statusText.length() > 0) {
			paramMap.put("statusText", statusText);
		}
		
		for(int i=0;i<3;i++) {
			String result = HttpUtil.post(url, paramMap);
			try {
				result = URLDecoder.decode(result, "UTF-8");// 解码
				result = URLDecoder.decode(result, "UTF-8");// 解码
				if("\"".equals(result.substring(result.length()-1,result.length())) && "\"".equals(result.substring(0,1))) {
					result = result.substring(1, result.length()-1);
				}
				// 处理回调数据 
				JSONObject resultJson = JSONObject.parseObject(result);
				if("200".equals(resultJson.getString("code"))) {
					is =  true;
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return is;
	}
	
}
