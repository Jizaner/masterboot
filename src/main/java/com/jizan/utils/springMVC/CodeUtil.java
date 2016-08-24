package com.jizan.utils.springMVC;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jizan.utils.JDBCTypesUtils;
import com.jizan.utils.StringUtil;

public class CodeUtil {

	/**
	 * 读取物理表字段名称及类型并保存为List
	 * 
	 * @param tableName
	 * @return
	 */
	public static List<Map<String, Object>> tableToModelData(String tableName) {
		String databaseName = "app_masters";
		String databaseUser = "root";
		String databasePass = "waz9cha0";
		String encodingType = "UTF8";
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/" + databaseName + "?" + "user=" + databaseUser + "&password="
				+ databasePass + "&useUnicode=true&characterEncoding=" + encodingType;
		List<Map<String, Object>> newObject = new ArrayList<Map<String, Object>>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url);
			PreparedStatement pment = conn.prepareStatement("select * from " + tableName + " where 1=2");
			ResultSet rs = pment.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();

			int columnCount = metaData.getColumnCount();

			for (int i = 1; i <= columnCount; i++) {
				Map<String, Object> newColumn = new HashMap<String, Object>();
				String columName = metaData.getColumnName(i);
				int type = metaData.getColumnType(i);// 获取每一列的数据类型
				newColumn.put("columnName", columName);
				newColumn.put("columnType", JDBCTypesUtils.getJavaTypeName(type));
				newObject.add(newColumn);
			}
			rs.close();
			pment.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newObject;
	}

	public static void truncateTable(String tableName) {
		String databaseName = "app_masters";
		String databaseUser = "root";
		String databasePass = "waz9cha0";
		String encodingType = "UTF8";
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/" + databaseName + "?" + "user=" + databaseUser + "&password="
				+ databasePass + "&useUnicode=true&characterEncoding=" + encodingType;
		List<Map<String, Object>> newObject = new ArrayList<Map<String, Object>>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url);
			PreparedStatement pment = conn.prepareStatement("truncate table " + tableName + ";");
			ResultSet rs = pment.executeQuery();
			rs.close();
			pment.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String makeModelProperties(List<?> modelObject, String entityName) {

		StringBuffer entityProperties = new StringBuffer();
		for (int i = 0; i < modelObject.size(); i++) {
			Map<?, ?> column = (Map<?, ?>) modelObject.get(i);
			entityProperties.append("private " + column.get("columnType") + " " + column.get("columnName") + ";\n");
		}
		return entityProperties.toString();
	}

	/**
	 * @param modelObject
	 * @param entityName
	 * @return 
	 */
	public static String[] createColumns(List<?> modelObject, String entityName) {

		String[] columns = new String[modelObject.size()];
		for (int i = 0; i < modelObject.size(); i++) {
			Map<?, ?> column = (Map<?, ?>) modelObject.get(i);
			columns[i]=column.get("columnName").toString();
		}
		return columns;
	}
	
	public static String createColumnsStr(List<?> modelObject, String entityName) {
		return StringUtil.join(createColumns(modelObject, entityName), ",");
	}
	
	public static String createMapperResultStr(List<?> modelObject, String entityName) {
		StringBuffer resultStr = new StringBuffer();
		for (int i = 0; i < modelObject.size(); i++) {
			Map<?, ?> column = (Map<?, ?>) modelObject.get(i);
			if(i==modelObject.size()-1){
				if (column.get("columnName").toString().equalsIgnoreCase("id")) {
					resultStr.append("		<id column = \"" + column.get("columnName") + "\" property = \""+column.get("columnName")+ "\" />");
				}else{
					resultStr.append("		<result column = \"" + column.get("columnName") + "\" property = \""+column.get("columnName")+ "\" />");
				}
			}else{
				if (column.get("columnName").toString().equalsIgnoreCase("id")) {
					resultStr.append("		<id column = \"" + column.get("columnName") + "\" property = \""+column.get("columnName")+ "\" />\n");
				}else{
					resultStr.append("		<result column = \"" + column.get("columnName") + "\" property = \""+column.get("columnName")+ "\" />\n");
				}
			}
		}
		return resultStr.toString();
	}
	
	public static String createMapperInsertValuesStr(List<?> modelObject, String entityName) {
		return StringUtil.join(createColumns(modelObject, entityName),"#{","}", ",");
	}
	
	public static String createMapperUpdateValuesStr(List<?> modelObject, String entityName) {
		StringBuffer updateValuesStr = new StringBuffer();
		for (int i = 0; i < modelObject.size(); i++) {
			Map<?, ?> column = (Map<?, ?>) modelObject.get(i);
			if (i<modelObject.size()-1) {
				updateValuesStr.append("		<if test=\"" + column.get("columnName") + " != null\">"+column.get("columnName")+ "= #{"+column.get("columnName")+"},</if>\n");
			}else if(i==modelObject.size()-1){
				updateValuesStr.append("		<if test=\"" + column.get("columnName") + " != null\">"+column.get("columnName")+ "= #{"+column.get("columnName")+"}</if>");
			}else{
				updateValuesStr.append("		<if test=\"" + column.get("columnName") + " != null\">"+column.get("columnName")+ "= #{"+column.get("columnName")+"}</if>\n");
			}
		}
		return updateValuesStr.toString();
	}
	
	public static String createMapperWhereStr(List<?> modelObject, String entityName) {
		StringBuffer whereStr = new StringBuffer();
		for (int i = 0; i < modelObject.size(); i++) {
			Map<?, ?> column = (Map<?, ?>) modelObject.get(i);
			if(i==modelObject.size()-1){
				whereStr.append("		<if test=\"" + column.get("columnName") + " != null\">and "+column.get("columnName")+ "= #{"+column.get("columnName")+"}</if>");
			}else{
				whereStr.append("		<if test=\"" + column.get("columnName") + " != null\">and "+column.get("columnName")+ "= #{"+column.get("columnName")+"}</if>\n");
			}
		}
		return whereStr.toString();
	}
	
	public static String createModelGettersAndSetters(List<?> modelObject, String entityName) {

		StringBuffer entityProperties = new StringBuffer();
		for (int i = 0; i < modelObject.size(); i++) {
			Map<?, ?> column = (Map<?, ?>) modelObject.get(i);
			entityProperties.append("	public " + column.get("columnType") + " get"+StringUtil.capitalise(column.get("columnName").toString() )+ "(){\n");
			entityProperties.append("		return " + column.get("columnName") + ";\n");
			entityProperties.append("	}\n\n");
			
			entityProperties.append("	public  void set"+StringUtil.capitalise(column.get("columnName").toString() )+"("+column.get("columnType") +" "+column.get("columnName")+")"+ "{\n");
			entityProperties.append("		this." + column.get("columnName") +" = " + column.get("columnName")+";\n");
			entityProperties.append("	}\n\n");
		}
		return entityProperties.toString();
	}
	
	public static String createModelProperties(List<?> modelObject, String entityName) {
		StringBuffer entityProperties = new StringBuffer();
		for (int i = 0; i < modelObject.size(); i++) {
			Map<?, ?> column = (Map<?, ?>) modelObject.get(i);
			String  string = "	private " + column.get("columnType") + " " + column.get("columnName") + ";\n";
			entityProperties.append(string);
		}
		return entityProperties.toString(); 
	}

	public static void createFile(String path, String content) {
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		try {
			fos = new FileOutputStream(new File(path));
			bos = new BufferedOutputStream(fos);
			bos.write(content.getBytes("UTF-8"));
			System.out.println("文件已生成:" + path);
			bos.flush();
			bos.close();
			fos.flush();
			fos.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/*public static void main(String[] args) {
	
	}*/

}
