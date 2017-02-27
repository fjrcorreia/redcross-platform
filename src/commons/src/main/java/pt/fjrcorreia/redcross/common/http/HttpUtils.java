/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pt.fjrcorreia.redcross.common.http;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
public class HttpUtils {
    
    
     public static String getCurrentPage(HttpServletRequest request) {
        String curPage = request.getContextPath() + request.getServletPath() + (request.getPathInfo() == null ? "" : request.getPathInfo());
        return curPage;
    }

}
