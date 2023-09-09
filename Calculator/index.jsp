<%@ page
import="java.text.*"
contentType="text/html; charset=UTF-8"
language="java"
pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
  <head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<link rel="stylesheet" href="./assets/css/style.css" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel = "icon" href="./assets/img/calculator_cartoon_picture.png" type="img/png">
      	<title>Calculator.net: Made by PhucBi</title>
  </head>
  <body>
		<div class="content">
			<div class="sub_content" >
				<div class="logo_img">
					<a href="./"><img src="./assets/img/calculator_logo.jpg" alt="calculator_logo"/></a>
				</div>
				<h1>Enter your calculation here</h1>
				<form class="form" method="get" action="Calculator" id="calcform">
					<div>
						<p class="frame">
						 	<c:choose>
								 <c:when test="${firstOper eq null}">
									 <input step="0.0001" type="number" id="query" name="firstOper" placeholder="First Operand"/>
								</c:when>
								 <c:otherwise>
									 <input step="0.0001" type="number" id="query" name="firstOper" placeholder="First Operand" value="${firstOper}"/>
								</c:otherwise>
							</c:choose>
						</p>
						Operator:
						<select class="select-frame" name="sign" id="sign" form="calcform">
						<c:choose>
							<c:when test="${sign eq null}">
								<option></option>
								<option value="plus_sign">+</option>
								<option value="minus_sign">-</option>
								<option value="multiply_sign">×</option>
								<option value="divide_sign">÷</option>
							</c:when> 
							<c:when test="${fn:length(sign) eq 0}">
								<option></option>
								<option value="plus_sign">+</option>
								<option value="minus_sign">-</option>
								<option value="multiply_sign">×</option>
								<option value="divide_sign">÷</option>
							</c:when>
							<c:when test="${sign eq 'plus_sign'}">
								<option></option>
								<option value="plus_sign" selected>+</option>
								<option value="minus_sign">-</option>
								<option value="multiply_sign">×</option>
								<option value="divide_sign">÷</option>
							</c:when>
							<c:when test="${sign eq 'minus_sign'}">
								<option></option>
								<option value="plus_sign">+</option>
								<option value="minus_sign" selected>-</option>
								<option value="multiply_sign">×</option>
								<option value="divide_sign">÷</option>
							</c:when>
							<c:when test="${sign eq 'multiply_sign'}">
								<option></option>
								<option value="plus_sign">+</option>
								<option value="minus_sign">-</option>
								<option value="multiply_sign" selected>×</option>
								<option value="divide_sign">÷</option>
							</c:when>
							<c:when test="${sign eq 'divide_sign'}">
								<option></option>
								<option value="plus_sign">+</option>
								<option value="minus_sign">-</option>
								<option value="multiply_sign">×</option>
								<option value="divide_sign" selected>÷</option>
							</c:when>
						</c:choose>
						</select>
						<p class="frame">
							<c:choose>
								<c:when test="${secondOper eq null}">
									<input step="0.0001" type="number" id="query" name="secondOper" placeholder="Second Operand"/>
								</c:when>
								<c:otherwise>
									<input step="0.0001" type="number" id="query" name="secondOper" placeholder="Second Operand" value="${secondOper}"/>
								</c:otherwise>
							</c:choose>
						</p>
						<p class="frame login">
							<input class="login" type="submit" value="Calculate" />
						</p>
					</div>
					${message}
				</form>
				<div class="result">
					<c:choose>
						<c:when test="${result ne null}">
							<c:choose>
								<c:when test="${fn:length(result) gt 0}">
									<h2>The result: <u>${result}</u></h2>
								</c:when>
								<c:otherwise>
									<h2>The result: __</h2>
								</c:otherwise>	
							</c:choose>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
  </body>
</html>