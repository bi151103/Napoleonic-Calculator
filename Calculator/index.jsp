<%@ page language="java"
import="java.text.*"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<style>
		.content {
				width: 100%;
				height: 100vh;
				display: flex;
				justify-content: center;
				align-items: center;
				background-image: url(./assets/img/internet_picture.jpg);
				background-size: cover;
				background-position: center;
		}

		.sub_content {
				width: 640px;
				background-color: #ffffffcc;
				border-radius: 12px;
				display: flex;
				align-items: center;
				flex-direction: column;
				/* padding: 24px; */
		}
		
		.result {
			margin-top: 48px;
		}

		.logo_img {
				margin-top: 24px;
				width: 180px;
				display: flex;
		}
			
		.logo_img img {
			margin-top: 8px;
			margin-bottom: 0px;
			width: 100%;
			object-fit: cover;
			object-position: center;
			border-radius: 2px;
		}
	
		h1,h2 {
				margin-top: 24px;
				margin-bottom: 24px;
				color: #292929;
				font-size: 1.6rem;
				font-weight: 700;
		}
	
		.frame {
				width: 180px;
				height: 40px;
				margin-top: 2px;
				margin-bottom: 8px;
				border-radius: 44px;
				border: 1px solid rgba(22, 24, 35, 0.713);
				overflow: hidden;
		}

		.select-frame {
				width: 40px;
				height: 40px;
				margin-top: 2px;
				margin-bottom: 8px;
				border-radius: 44px;
				border: 1px solid rgba(22, 24, 35, 0.713);
				overflow: hidden;
		}
	
		.frame input {
				display: block;
				width: 100%;
				height: 100%;
				margin-bottom: 12px;
				border-radius: 44px;
				padding: 0 12px;
				font-size: 1rem;
				font-weight: 1000;
				background: rgba(22, 24, 35, 0.06);
				border: none;
				outline: none;
		}

		.select-frame option {
				display: block;
				font-size: 2rem;
				font-weight: 500;
				width: 100%;
				height: 100%;
				background: #fed700;
		}
	
		.frame_display_password {
				margin-bottom: 12px;
		}
	
		.login,
		.reg {
				background: #fed700;
				cursor: pointer;
				transition: background-color 0.3s;
		}
		.login:hover,
		.reg:hover {
				background-color: #ff8c00;
		}
	
		.register {
				text-decoration: none;
		}
	
		/* Register */
	
		.sub_content--register {
				height: 650px;
		}
	
		.h1--register {
				margin-top: 18px;
		}
	
		.info-reg {
			margin-top: 10px;
		}
		.desc {
				margin-bottom: 6px;
				margin-left: 10px;
				font-size: 1rem;
		}
	</style>
  <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Calculator.net: Made by PhucBi</title>
  </head>
	<%
		String sign = (String) request.getAttribute("sign");
		String firstOper = (String) request.getAttribute("firstOper");
		String secondOper = (String) request.getAttribute("secondOper");
		String result = (String) request.getAttribute("result");
	%>
  <body>
		<div class="content">
			<div class="sub_content" >
				<div class="logo_img">
						<a href="index.jsp"><img src="./assets/img/calculator_logo.jpg" alt="calculator_logo"/></a>
				</div>
				<h1>Enter your calculation here</h1>
				<form class="form" method="get" action="Calculator" id="calcform">
					<div>
						<p class="frame">
							<%if(firstOper == null) {%>
								<input step="0.0001" type="number" id="query" name="firstOper" placeholder="First Operand"/>
							<%} else {%>
								<input step="0.0001" type="number" id="query" name="firstOper" placeholder="First Operand" value="<%=firstOper%>"/>
							<%}%>
						</p>
						Operator:
						<select class="select-frame" name="sign" id="sign" form="calcform">
						<%if(sign == null) {%>
							<option></option>
							<option value="plus_sign">+</option>
							<option value="minus_sign">-</option>
							<option value="multiply_sign">×</option>
							<option value="divide_sign">÷</option>
						<%} else if(sign.length() == 0) {%>
							<option></option>
							<option value="plus_sign">+</option>
							<option value="minus_sign">-</option>
							<option value="multiply_sign">×</option>
							<option value="divide_sign">÷</option>
						<%} else if(sign.equals("plus_sign")) {%>
							<option></option>
							<option value="plus_sign" selected>+</option>
							<option value="minus_sign">-</option>
							<option value="multiply_sign">×</option>
							<option value="divide_sign">÷</option>
						<%} else if(sign.equals("minus_sign")) {%>
							<option></option>
							<option value="plus_sign">+</option>
							<option value="minus_sign" selected>-</option>
							<option value="multiply_sign">×</option>
							<option value="divide_sign">÷</option>
						<%} else if(sign.equals("multiply_sign")) {%>
							<option></option>
							<option value="plus_sign">+</option>
							<option value="minus_sign">-</option>
							<option value="multiply_sign" selected>×</option>
							<option value="divide_sign">÷</option>
						<%} else if(sign.equals("divide_sign")) {%>
							<option></option>
							<option value="plus_sign">+</option>
							<option value="minus_sign">-</option>
							<option value="multiply_sign">×</option>
							<option value="divide_sign" selected>÷</option>
						<%}%>
						</select>
						<p class="frame">
							<%if(secondOper == null) {%>
								<input step="0.0001" type="number" id="query" name="secondOper" placeholder="Second Operand"/>
							<%} else {%>
								<input step="0.0001" type="number" id="query" name="secondOper" placeholder="Second Operand" value="<%=secondOper%>"/>
							<%}%>
						</p>
						<p class="frame login">
							<input class="login" type="submit" value="Calculate" />
						</p>
					</div>
					${message}
				</form>
				<div class="result">
					<%if(result != null) {
						if(result.length() > 0) {%>
							<h2>The result: <u><%=result%></u></h2>
						<%} else {%>
							<h2>The result: __</h2>
						<%}
					} else {%>
						<h2>The result: __</h2>
					<%}%>
				</div>
			</div>
		</div>
  </body>
</html>