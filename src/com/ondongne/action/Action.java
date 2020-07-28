package com.ondongne.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.dto.ActionForward;

public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
