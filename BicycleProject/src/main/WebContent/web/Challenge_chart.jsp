<%@page import="org.json.simple.JSONArray"%>
<%@page import="database.ChallegeDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
ChallegeDao challegeDao = new ChallegeDao();

JSONArray jsonArray = challegeDao.getdistrank();

%>

<%=jsonArray %>
