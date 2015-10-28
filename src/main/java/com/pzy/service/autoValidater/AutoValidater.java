package com.pzy.service.autoValidater;

import java.io.IOException;

import com.pzy.entity.Submission;
import com.pzy.exception.ValidateException;

public abstract class   AutoValidater {
	protected abstract void makeFile(String input) throws IOException;
	protected abstract String Compile() throws IOException;
	protected abstract String run(String input) throws IOException;
	public  void  validate(Submission submission){
		/**写文件*/
		try {
			makeFile(submission.getInput());
		}catch (Exception e) {
			submission.setState("文件错误");
			e.printStackTrace();
			return;
		}
	
		/**编译*/
		try {
			String  res=Compile();
			submission.setResult(res);
		} catch (ValidateException e) {
			submission.setResult(e.getMessage());
			submission.setState("编译错误");
			e.printStackTrace();
			return;
		}catch (Exception e) {
			submission.setState("编译错误");
			e.printStackTrace();
			return;
		}

		/**运行*/
		try {
			String output=run(submission.getProblem().getInputok());
			submission.setResult(output);
			/**是否通过*/
			if(output!=null&&output.equals(submission.getProblem().getOutputok())){
				submission.setState("成功");
			}else{
				submission.setState("答案错误");
			}
		}catch (Exception e) {
			submission.setState("运行错误");
			e.printStackTrace();
			return;
		}
		
	}
}
