package com.pzy.service.autoValidater;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.commons.lang3.StringUtils;

import com.pzy.exception.ValidateException;
public class JavaValidater extends AutoValidater{

	private static String workpath="d:/work_path/java/";
	
	protected void makeFile(String input) throws IOException {
		  String filepath = workpath+"Main.java";
		  File file = new File(filepath);
		  if(file.exists())
			  file.delete();
		  file.createNewFile();
		  BufferedWriter bw = new BufferedWriter(new FileWriter(file, true));
		  bw.write(input);
		  bw.flush();
		  bw.close();
	}

	@Override
	protected String Compile() throws IOException,ValidateException {
		 Process process = Runtime.getRuntime().exec("javac "+workpath+"Main.java"); 
         BufferedReader br = new BufferedReader(new InputStreamReader(process.getErrorStream()));  
         String s = null;
         String res="";
         while ((s = br.readLine()) != null) {  
         		res+=s+"\n";
         	  System.out.println("编译-命令----"+s);
         }
         if(StringUtils.countMatches(res, "\n")>1){
        	 throw new ValidateException("编译错误"+res);
         }
        return res;
	}

	@Override
	protected String run(String input) throws IOException {
		 Process process = Runtime.getRuntime().exec(workpath+"bat.bat"); 
         BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));  
         DataOutputStream dataOut = new DataOutputStream(process.getOutputStream());
         dataOut.writeBytes(input.replace("\r", "")+"\n");
         dataOut.flush();
         String result="";
         String line = bufferedReader.readLine();  
         while (line!=null) { 
         	  System.out.println("运行-命令----"+line);
         	  result=line;
         	 line= bufferedReader.readLine(); 
         }
         dataOut.close();
         System.out.println("最终结果----"+result);
         return result;
	}

}
