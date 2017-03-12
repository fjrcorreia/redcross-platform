/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pt.fjrcorreia.redcross.portal;

import javax.servlet.http.HttpServletRequest;
import pt.fjrcorreia.redcross.security.PlatformUser;

/**
 * <jsp:useBean id="userBean" class="pt.fjrcorreia.redcross.portal.UserBean" scope="session" />
 * <%-- intialize bean properties --%>
 * <jsp:setProperty name="userBean" property="request" value="value1" />
 *
 * </jsp:useBean> @author Francisco Correia
 * {@literal <https://github.com/fjrcorreia>}
 */
public class UserBean {

    public PlatformUser getUser(HttpServletRequest request){
        return new PlatformUser() {
            @Override
            public String getEmail() {
                return "user@mail.dom";
            }

            @Override
            public String getDisplayName() {
                return "Full Name";
            }

            @Override
            public String getName() {
                return "Principal";
            }
        };
    }
}
