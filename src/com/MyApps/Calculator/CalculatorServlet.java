package com.MyApps.Calculator;
import java.io.IOException;

import javax.print.DocPrintJob;
import java.text.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class CalculatorServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String firstOper = request.getParameter("firstOper");
        String secondOper = request.getParameter("secondOper");
        String sign = request.getParameter("sign");
        String result = "";
        if(firstOper.length() == 0 && secondOper.length() == 0) 
            request.setAttribute("message", "Please enter operands");
        else if(firstOper.length() == 0) {
            request.setAttribute("message", "Please enter first operand");
        }
        else if(secondOper.length() == 0) {
            request.setAttribute("message", "Please enter second operand");
        } 
        else {
            if(sign.equals("plus_sign"))
                result = new DecimalFormat("0.#####").format(Double.parseDouble(firstOper) + Double.parseDouble(secondOper));
            else if(sign.equals("minus_sign")) 
                result = new DecimalFormat("0.#####").format(Double.parseDouble(firstOper) - Double.parseDouble(secondOper));
            else if(sign.equals("multiply_sign")) 
                result = new DecimalFormat("0.#####").format(Double.parseDouble(firstOper) * Double.parseDouble(secondOper));
            else if(sign.equals("divide_sign")) {
                Double secondOperand = Double.parseDouble(secondOper);
                if(secondOperand == 0) result = "INF";
                else result = new DecimalFormat("0.#####").format(Double.parseDouble(firstOper) / Double.parseDouble(secondOper));
            }
            else request.setAttribute("message", "Please choose operator");
        }
        request.setAttribute("result", result);
        request.setAttribute("firstOper", firstOper);
        request.setAttribute("secondOper", secondOper);
        request.setAttribute("sign", sign);
        RequestDispatcher view = request.getRequestDispatcher("index.jsp");
        view.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
        response.setContentType("text/html");
        String firstOper = request.getParameter("firstOper");
        String secondOper = request.getParameter("secondOper");
        String sign = request.getParameter("sign");
        String result = "";
        if(firstOper.length() == 0 && secondOper.length() == 0) 
            request.setAttribute("message", "Please enter operands");
        else if(firstOper.length() == 0) {
            request.setAttribute("message", "Please enter first operand");
        }
        else if(secondOper.length() == 0) {
            request.setAttribute("message", "Please enter second operand");
        } 
        else {
            if(sign.equals("plus_sign"))
                result = new DecimalFormat("0.#####").format(Double.parseDouble(firstOper) + Double.parseDouble(secondOper));
            else if(sign.equals("minus_sign")) 
                result = new DecimalFormat("0.#####").format(Double.parseDouble(firstOper) - Double.parseDouble(secondOper));
            else if(sign.equals("multiply_sign")) 
                result = new DecimalFormat("0.#####").format(Double.parseDouble(firstOper) * Double.parseDouble(secondOper));
            else if(sign.equals("divide_sign")) {
                Double secondOperand = Double.parseDouble(secondOper);
                if(secondOperand == 0) result = "INF";
                else result = new DecimalFormat("0.#####").format(Double.parseDouble(firstOper) / Double.parseDouble(secondOper));
            }
            else request.setAttribute("message", "Please choose operator");
        }
        request.setAttribute("result", result);
        request.setAttribute("firstOper", firstOper);
        request.setAttribute("secondOper", secondOper);
        request.setAttribute("sign", sign);
        RequestDispatcher view = request.getRequestDispatcher("index.jsp");
        view.forward(request, response);
    }
}