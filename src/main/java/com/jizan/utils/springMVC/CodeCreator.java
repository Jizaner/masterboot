package com.jizan.utils.springMVC;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;

public class CodeCreator {

	public String GroupId;// 项目物理目录

	public String ArtifactId;// 模板物理目录

	public String projectDir;// 项目物理目录

	public String templateDir;// 模板物理目录

	public String controllerDir;// 生成文件的存放物理目录

	public String daoDir;// 生成文件的存放物理目录

	public String entityDir;// 生成文件的存放物理目录

	public String serviceDir;// 生成文件的存放物理目录

	public String serviceimplDir;// 生成文件的存放物理目录

	public String mapperDir;// 生成文件的存放物理目录

	public static void main(String[] args) {
		//CodeUtil.truncateTable("tb_versions");
		createCodes("Advertisement","tb_ads");
	}

	public static void createCodes(String entityName,String tableName){
		//String entityName = "Tag";
		//String tableName = "tb_tags";
		CodeCreator code = new CodeCreator("com.jizan", "master");
		code.makeController(entityName);
		code.makeDao(entityName);
		code.makeService(entityName);
		code.makeServiceImpl(entityName);
		code.makeModel(entityName,tableName);
		code.makeMapper(entityName,tableName);
		System.out.println("执行完毕！请在项目根节点点击刷新或按F5键");
	}
	public CodeCreator(String groupId, String artifactId) {
		String seperator = "/";
		String os = System.getProperty("os.name");
		if (os.toLowerCase().startsWith("win")) {
			seperator = "\\";
		}

		this.GroupId = groupId;
		this.ArtifactId = artifactId;
		this.projectDir = System.getProperty("user.dir") + "/src/main/java/" + groupId.replace(".", "/") + "/"
				+ ArtifactId + "/".replace("/", seperator);
		this.templateDir = System.getProperty("user.dir") + "/src/main/java/" + groupId.replace(".", "/") + "/"
				+ "utils/springMVC".replace("/", seperator);
		this.controllerDir = projectDir + "api/".replace("/", seperator);
		this.daoDir = projectDir + "dao/".replace("/", seperator);
		this.entityDir = projectDir + "entity/".replace("/", seperator);
		this.serviceDir = projectDir + "service/".replace("/", seperator);
		this.serviceimplDir = serviceDir + "impl/".replace("/", seperator);
		this.mapperDir = System.getProperty("user.dir") + "/src/main/resources/mappers/".replace("/", seperator);

	}

	/**
	 * 创建Controller代码文件
	 * 
	 * @param entityName
	 *            实体名称
	 */
	public void makeController(String entityName) {
		String[][] replacerArray = { { "{EntityName}", entityName }, { "{entityName}", entityName.toLowerCase() },
				{ "{GroupId}", this.GroupId }, { "{ArtifactId}", this.ArtifactId } };
		readTemplateFile(templateDir, "TemplateController.txt", replacerArray,
				controllerDir + entityName + "Controller.java");
	}

	/**
	 * 创建mapper.xml文件
	 * 
	 * @param entityName
	 *            实体名称
	 */
	public void makeMapper(String entityName,String tableName) {
		List<?> modelObject = CodeUtil.tableToModelData(tableName);
		//------replace--------
		String resultStr=CodeUtil.createMapperResultStr(modelObject, entityName);
		String insertValuesStr= CodeUtil.createMapperInsertValuesStr(modelObject, entityName);
		String updateValuesStr=CodeUtil.createMapperUpdateValuesStr(modelObject, entityName);
		String whereStr=CodeUtil.createMapperWhereStr(modelObject, entityName);
		String colsStr = CodeUtil.createColumnsStr(modelObject, entityName);
		String[][] replacerArray = { { "{TableName}", tableName}, { "{results_str}", resultStr},{ "{values_str}", insertValuesStr},{ "{update_values_str}", updateValuesStr},{ "{where_str}", whereStr}, { "{colums_str}", colsStr}, { "{EntityName}", entityName },
				{ "{entityName}", entityName.toLowerCase() }, { "{GroupId}", this.GroupId },
				{ "{ArtifactId}", this.ArtifactId } };
		readTemplateFile(templateDir, "TemplateMapping.txt", replacerArray, mapperDir + entityName + "Mapper.xml");
	}

	/**
	 * 创建DAO代码文件
	 * 
	 * @param entityName
	 *            实体名称
	 */
	public void makeDao(String entityName) {
		String[][] replacerArray = { { "{EntityName}", entityName }, { "{entityName}", entityName.toLowerCase() },
				{ "{GroupId}", this.GroupId }, { "{ArtifactId}", this.ArtifactId } };
		readTemplateFile(templateDir, "TemplateDAO.txt", replacerArray, daoDir + entityName + "Dao.java");
	}

	/**
	 * 创建Model代码文件
	 * 
	 * @param entityName
	 */
	public void makeModel(String entityName,String tableName) {
		List<?> modelObject = CodeUtil.tableToModelData(tableName);
		String properties = CodeUtil.createModelProperties(modelObject, entityName);
		String getters_setters = CodeUtil.createModelGettersAndSetters(modelObject, entityName);
		String[][] replacerArray = { { "{getters_setters}", getters_setters }, { "{properties}", properties },
				{ "{EntityName}", entityName }, { "{entityName}", entityName.toLowerCase() },
				{ "{GroupId}", this.GroupId }, { "{ArtifactId}", this.ArtifactId } };
		readTemplateFile(templateDir, "TemplateModel.txt", replacerArray, entityDir + entityName + ".java");
	}

	/**
	 * 创建service代码文件
	 * 
	 * @param entityName
	 *            实体名称
	 */
	public void makeService(String entityName) {
		String[][] replacerArray = { { "{EntityName}", entityName }, { "{entityName}", entityName.toLowerCase() },
				{ "{GroupId}", this.GroupId }, { "{ArtifactId}", this.ArtifactId } };
		readTemplateFile(templateDir, "TemplateService.txt", replacerArray, serviceDir + entityName + "Service.java");
	}

	/**
	 * 创建service implement代码文件
	 * 
	 * @param entityName
	 *            实体名称
	 */
	public void makeServiceImpl(String entityName) {
		String[][] replacerArray = { { "{EntityName}", entityName }, { "{entityName}", entityName.toLowerCase() },
				{ "{GroupId}", this.GroupId }, { "{ArtifactId}", this.ArtifactId } };
		readTemplateFile(templateDir, "TemplateServiceImpl.txt", replacerArray,
				serviceimplDir + entityName + "ServiceImpl.java");
	}

	/**
	 * 读取模板文件后，输出并保存转换后的代码文件
	 * 
	 * @param inFilePath
	 *            模板文件所在的物理目录
	 * @param inFileName
	 *            模板文件名称
	 * @param entityName
	 *            实体名称
	 * @param outFilePath
	 *            生成文件的存放物理目录
	 */
	public void readTemplateFile(String inFilePath, String inFileName, String[][] replacerArray, String outFilePath) {
		try {
			String encoding = "UTF-8";
			File file = new File(inFilePath + "/" + inFileName);
			if ((file.isFile()) && (file.exists())) {
				InputStreamReader read = new InputStreamReader(new FileInputStream(file), encoding);
				BufferedReader bufferedReader = new BufferedReader(read);

				StringBuffer strBuf = new StringBuffer();
				for (String tmp = null; (tmp = bufferedReader.readLine()) != null; tmp = null) {
					for (int i = 0; i < replacerArray.length; i++) {
						tmp = tmp.replace(replacerArray[i][0].toString(), replacerArray[i][1].toString());
					}
					strBuf.append(tmp);
					strBuf.append(System.getProperty("line.separator"));
				}
				read.close();
				PrintWriter printWriter = new PrintWriter(outFilePath);
				printWriter.write(strBuf.toString().toCharArray());
				printWriter.flush();
				printWriter.close();
			} else {
				System.out.println("!!!找不到指定的模板文件：" + inFileName);
			}
		} catch (Exception e) {
			System.out.println("!!!读取模板文件：" + inFileName + "内容出错");
			e.printStackTrace();
		}
	}
}
