package com.pzy.utils;

import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.Scanner;

public class Test {

	 public static void main(String[] args) throws IOException {  
/*		 createFile("import java.util.Scanner;"+
"public class Maia{"+
"    public static void main(String[] args){"+
"        Scanner in=new Scanner(System.in);"+
 "       int a=in.nextInt();"+
 "       int b=in.nextInt();"+
 "       System.out.println((a+b));  "+
"    }"+
"}");*/
		 run();
		 //complier();
	       /* try {  
	          
	            Process p = Runtime.getRuntime().exec("ping www.baidu.com");  
	          
	            BufferedReader br = new BufferedReader(new InputStreamReader(p .getInputStream()));  
	            String line = "";  
	            while ((line = br.readLine()) != null) {  
	                System.out.println(line);  
	            }  
	            br.close();  
	        } catch (IOException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  */
	    }  
	 public static void complier(){
		 try {  
	          
	            Process process = Runtime.getRuntime().exec("javac"); 
	            PrintWriter writer = new PrintWriter(process.getOutputStream());  
	            new CommandThread(writer).start(); 
	            BufferedReader br = new BufferedReader(new InputStreamReader(process.getErrorStream()));  
	              
	            String s = null;  
	            while ((s = br.readLine()) != null) {  
	                System.out.println(s);  
	            }  
	            Thread.currentThread().interrupt();  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	 }
	 public static void run() throws IOException{
	            Process process = Runtime.getRuntime().exec("D:\\test\\bat.bat"); 
	            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));  
	            DataOutputStream dataOut = new DataOutputStream(process.getOutputStream());
                dataOut.writeBytes("1\n3\n");
                dataOut.flush();
                dataOut.close();
                String result="";
	            String line = bufferedReader.readLine();  
	            while (line!=null) {  
	            	  result=line;
	            	 line= bufferedReader.readLine(); 
	            }
	            System.out.println("debug----"+result);
	 }
	 public static void createFile(String str) throws IOException{
		  String lujing = "d:\\test\\Main.java";
		  File file = new File(lujing);
		  if(file.exists())
			  file.delete();
		  file.createNewFile();
		  BufferedWriter bw = new BufferedWriter(new FileWriter(file, true));
		  bw.write(str);
		  bw.flush();
		  bw.close();
	 }
	 static class CommandThread extends Thread{  
	        PrintWriter writer;  
	        BufferedReader br = null;  
	        CommandThread(PrintWriter writer){  
	            this.writer = writer;  
	            br = new BufferedReader(new InputStreamReader(System.in));  
	            this.setDaemon(true);  
	        }  
	          
	        @Override  
	        public void run() {  
	            try {  
	                String cmd = null;  
	                while((cmd = br.readLine()) != null){  
	                    writer.println(cmd);  
	                    writer.flush();  
	                }  
	            } catch (IOException e) {  
	                e.printStackTrace();  
	            }  
	        }  
	    }  
}