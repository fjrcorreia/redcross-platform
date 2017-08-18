<%@page import="pt.fjrcorreia.redcross.security.PlatformUser"%>
<!DOCTYPE html>

<jsp:useBean id="userBean" class="pt.fjrcorreia.redcross.portal.UserBean" scope="session" >
    <%-- intialize bean properties 
    <jsp:setProperty name="userBean" property="request" value="value1" />
    --%>
</jsp:useBean>


<%
    String param = request.getParameter("logout");
    if (param != null){
        System.out.println("Do Logout");
        request.logout();
        response.sendRedirect("/portal");
    }
    PlatformUser user = userBean.getUser(request);
%>
<html lang="pt">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="">
        <title>CVP Maiorca</title>

        <!-- favorite icon/shortcut icon -->
        <link href="/static/img/favicon/redcrosso_favicon1.png" rel="icon" type="image/png" />



        <link href="/static/css/estilo.css" rel="stylesheet" type="text/css" />


        <!-- Font Awesome
        home: http://fontawesome.io/
        * Icons: http://fontawesome.io/icons/
        -->
        <link href="/static/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />

        <!-- Bootstrap
        * Bootstrap Classes: http://www.w3schools.com/bootstrap/bootstrap_ref_all_classes.asp
        * Glyphicons: http://www.w3schools.com/bootstrap/bootstrap_ref_comp_glyphs.asp
        -->
        <link href="/static/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    </head>

    <!--body class="fundo" onload="init_user_info()"-->
    <body class="fundo" >

        <div class="titulo">
            <h1>DELEGA&#199;&#195;O de MAIORCA</h1>
            <h2>COORDENA��O LOCAL DE EMERG�NCIA</h2> 
        </div>

        <nav class="menu navbar navbar-inverse" role="navigation">
            <div class="container-fluid">

                <div class="navbar-header">

                </div>

                <div id="navbar" class="navbar-collapse collapse">

                    <ul class="nav navbar-nav navbar-center">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Disponibilidades
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Voluntariado</a></li>
                                <li><a href="#">Noites</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-center">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Escalas
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Voluntariado</a></li>
                                <li><a href="#">Noites</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                                <!--span class="session-user.icon"><i class="glyphicon glyphicon-user"></i></span-->
                                <span class="session-user-avatar"><i class="glyphicon glyphicon-user"></i></span>
                                <span>  </span>
                                <span class="session-username"><%=user.getDisplayName()%></span>
                                <!-- <b class="caret"></b> -->
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#"><i class="fa fa-fw fa-user"></i> Perfil</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="?logout=true"><i class="fa fa-fw fa-power-off"></i> Terminar Sessão </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div>


            <table cellspacing="0" border="1" style="background-color: #FFFFFF;opacity: 0.9;">
                <!-- ??? -->
                <colgroup width="181"></colgroup>
                <colgroup width="81"></colgroup>
                <colgroup width="179"></colgroup>
                <colgroup span="28" width="36"></colgroup>
                <colgroup width="177"></colgroup>
                <colgroup width="55"></colgroup> 
                <colgroup width="13"></colgroup>




                <tr>
                    <td style="border-top: 2px solid #000000; border-left: 2px solid #000000" rowspan=3 height="62" align="center" valign=middle bgcolor="#C0C0C0"><b><font face="Arial" size=1>Categoria</font></b></td>
                    <td style="border-top: 2px solid #000000" rowspan=3 align="center" valign=middle bgcolor="#C0C0C0"><b><font face="Arial" size=1> RECRUTA</font></b></td>
                    <td style="border-top: 2px solid #000000; border-right: 2px solid #000000" rowspan=3 align="center" valign=middle bgcolor="#C0C0C0"><b><font face="Arial" size=1>NOME</font></b></td>
                    <td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=28 align="center" valign=middle bgcolor="#CCFFCC"><b><font face="Arial" size=1 color="#000000">JANEIRO / FEVEREIRO </font></b></td>
                    <td style="border-top: 2px solid #000000; border-left: 2px solid #000000" rowspan=3 align="center" valign=middle><b><font face="Arial" size=1>Observações</font></b></td>
                    <td style="border-top: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" rowspan=3 align="center" valign=middle><b><font face="Arial" size=1>Horas</font></b></td>
                    <td align="left" valign=bottom><font color="#000000"><br></font></td>
                </tr>
                <tr>
                    <td class="table-td1" align="center" valign=middle sdval="19" sdnum="1033;"><b><font face="Arial" size=1>19</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="20" sdnum="1033;"><b><font face="Arial" size=1>20</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="21" sdnum="1033;"><b><font face="Arial" size=1>21</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="22" sdnum="1033;"><b><font face="Arial" size=1>22</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="23" sdnum="1033;"><b><font face="Arial" size=1>23</font></b></td>
                    <td class="table-td1" align="center" valign=middle bgcolor="#A6A6A6" sdval="24" sdnum="1033;"><b><font face="Arial" size=1>24</font></b></td>
                    <td class="table-td1" align="center" valign=middle bgcolor="#A6A6A6" sdval="25" sdnum="1033;"><b><font face="Arial" size=1>25</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="26" sdnum="1033;"><b><font face="Arial" size=1>26</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="27" sdnum="1033;"><b><font face="Arial" size=1>27</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="28" sdnum="1033;"><b><font face="Arial" size=1>28</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="29" sdnum="1033;"><b><font face="Arial" size=1>29</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="30" sdnum="1033;"><b><font face="Arial" size=1>30</font></b></td>
                    <td class="table-td1" align="center" valign=middle bgcolor="#A6A6A6" sdval="31" sdnum="1033;"><b><font face="Arial" size=1>31</font></b></td>
                    <td class="table-td1" align="center" valign=middle bgcolor="#A6A6A6" sdval="1" sdnum="1033;"><b><font face="Arial" size=1>1</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="2" sdnum="1033;"><b><font face="Arial" size=1>2</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="3" sdnum="1033;"><b><font face="Arial" size=1>3</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="4" sdnum="1033;"><b><font face="Arial" size=1>4</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="5" sdnum="1033;"><b><font face="Arial" size=1>5</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="6" sdnum="1033;"><b><font face="Arial" size=1>6</font></b></td>
                    <td class="table-td1" align="center" valign=middle bgcolor="#A6A6A6" sdval="7" sdnum="1033;"><b><font face="Arial" size=1>7</font></b></td>
                    <td class="table-td1" align="center" valign=middle bgcolor="#A6A6A6" sdval="8" sdnum="1033;"><b><font face="Arial" size=1>8</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="9" sdnum="1033;"><b><font face="Arial" size=1>9</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="10" sdnum="1033;"><b><font face="Arial" size=1>10</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="11" sdnum="1033;"><b><font face="Arial" size=1>11</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="12" sdnum="1033;"><b><font face="Arial" size=1>12</font></b></td>
                    <td class="table-td1" align="center" valign=middle sdval="13" sdnum="1033;"><b><font face="Arial" size=1>13</font></b></td>
                    <td class="table-td1" align="center" valign=middle bgcolor="#A6A6A6" sdval="14" sdnum="1033;"><b><font face="Arial" size=1>14</font></b></td>
                    <td class="table-td1" align="center" valign=middle bgcolor="#A6A6A6" sdval="15" sdnum="1033;"><b><font face="Arial" size=1>15</font></b></td>
                    <td align="left" valign=bottom><font color="#000000"><br></font></td>
                </tr>
                <tr>
                    <td class="table-td2" >S</font></b></td>
                    <td class="table-td3" >T</td>
                    <td class="table-td3" >Q</td>
                    <td class="table-td3" >Q</td>
                    <td class="table-td3" >S</td>
                    <td class="table-td3" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Arial" size=1>S</font></b></td>
                    <td class="table-td3" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Arial" size=1>D</font></b></td>
                    <td class="table-td3" >S</td>
                    <td class="table-td3" >T</td>
                    <td class="table-td3" >Q</td>
                    <td class="table-td3" >Q</td>
                    <td class="table-td3" >S</td>
                    <td class="table-td3" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Arial" size=1>S</font></b></td>
                    <td class="table-td3" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Arial" size=1>D</font></b></td>
                    <td class="table-td3" >S</td>
                    <td class="table-td3" >T</td>
                    <td class="table-td3" >Q</td>
                    <td class="table-td3" >Q</td>
                    <td class="table-td3" >S</td>
                    <td class="table-td3" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Arial" size=1>S</font></b></td>
                    <td class="table-td3" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Arial" size=1>D</font></b></td>
                    <td class="table-td3" >S</td>
                    <td class="table-td3" >T</td>
                    <td class="table-td3" >Q</td>
                    <td class="table-td3" >Q</td>
                    <td class="table-td3" >S</td>
                    <td class="table-td3" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Arial" size=1>S</font></b></td>
                    <td class="table-td4" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Arial" size=1>D</font></b></td>
                    <td align="left" valign=bottom><font color="#000000"><br></font></td>
                </tr>
                <tr>
                    <td class="table-td5" height="20" align="center" valign=middle>COORD.</td>
                    <td class="table-td6" align="center" valign=middle sdval="1999" sdnum="1033;0;0"><b><font face="Arial Black">1999</font></b></td>
                    <td class="table-td7" align="left" valign=middle><b><font face="Arial">Luis Lopes</font></b></td>
                    <td class="table-td6" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS">SE</font></b></td>
                    <td class="table-td8" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS">CE</font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td8" align="center" valign=middle><b><font face="Comic Sans MS">CE</font></b></td>
                    <td class="table-td8" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000" align="center" valign=middle><font face="Arial" size=1><br></font></td>
                    <td class="table-td5" align="center" valign=middle sdval="9" sdnum="1033;0;0.0"><b><font face="Arial" size=1 color="#000000">9.0</font></b></td>
                    <td align="left" valign=bottom><font color="#000000"><br></font></td>
                </tr>

                <tr>
                    <td class="table-td9" height="20" align="center" valign=middle><font color="#000000">E. EMERG. PRINCIPAL</font></td>
                    <td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle sdval="2003" sdnum="1033;0;0"><b><font face="Arial Black">2003</font></b></td>
                    <td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" align="left" valign=middle><b><font face="Arial">Bruno Ferreira</font></b></td>
                    <td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-right: 1px solid #000000" colspan=28 align="center" valign=middle><b><font face="Comic Sans MS"><br><img src="Escala%202015_html_28d387df.png" width=986 height=6 hspace=24 vspace=7>
                            </font></b></td>
                    <td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000" align="center" valign=middle><font face="Arial" size=1><br></font></td>
                    <td class="table-td9" align="center" valign=middle sdval="0" sdnum="1033;0;0.0"><b><font face="Arial" size=1 color="#000000">0.0</font></b></td>
                    <td align="left" valign=bottom><font color="#000000"><br></font></td>
                </tr>

                <tr>
                    <td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" height="27" align="center" valign=middle><font color="#000000">ESP. EMERG.</font></td>
                    <td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-right: 1px solid #000000" align="center" valign=middle sdval="2013" sdnum="1033;0;0"><b><font face="Arial Black">2013</font></b></td>
                    <td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" align="left" valign=middle><b><font face="Arial">Mariana Silva </font></b></td>
                    <td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS">SE</font></b></td>
                    <td class="table-td10" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS">TS</font></b></td>
                    <td class="table-td10" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle><b><font face="Comic Sans MS"><br></font></b></td>
                    <td class="table-td10" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000" align="center" valign=middle bgcolor="#A6A6A6"><b><font face="Comic Sans MS"><br></font></b></td>
                    <td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000" align="center" valign=middle><font face="Arial" size=1 color="#FFFFFF"><br></font></td>
                    <td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" align="center" valign=middle sdval="12" sdnum="1033;0;0.0"><b><font face="Arial" size=1 color="#000000">12.0</font></b></td>
                    <td align="left" valign=bottom><font color="#000000"><br></font></td>
                </tr>
                <tr class="sum" >
                    <td height="20" align="center" valign=middle><font size=1 color="#000000"><br></font></td>
                    <td align="center" valign=middle sdnum="1033;0;0"><b><font face="Arial Black"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial"><br></font></b></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="3" sdnum="1033;"><font face="Comic Sans MS">3</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="3" sdnum="1033;"><font face="Comic Sans MS">3</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="4" sdnum="1033;"><font face="Comic Sans MS">4</font></td>
                    <td align="center" valign=middle sdval="4" sdnum="1033;"><font face="Comic Sans MS">4</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="3" sdnum="1033;"><font face="Comic Sans MS">3</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="3" sdnum="1033;"><font face="Comic Sans MS">3</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="4" sdnum="1033;"><font face="Comic Sans MS">4</font></td>
                    <td align="center" valign=middle sdval="4" sdnum="1033;"><font face="Comic Sans MS">4</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="3" sdnum="1033;"><font face="Comic Sans MS">3</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="3" sdnum="1033;"><font face="Comic Sans MS">3</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="4" sdnum="1033;"><font face="Comic Sans MS">4</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="3" sdnum="1033;"><font face="Comic Sans MS">3</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="3" sdnum="1033;"><font face="Comic Sans MS">3</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="5" sdnum="1033;"><font face="Comic Sans MS">5</font></td>
                    <td align="center" valign=middle sdval="4" sdnum="1033;"><font face="Comic Sans MS">4</font></td>
                    <td align="center" valign=middle><font face="Arial" size=1><br></font></td>
                    <td align="center" valign=middle sdval="542" sdnum="1033;0;0.0"><font face="Arial" size=1 color="#000000">542.0</font></td>
                    <td align="left" valign=middle><font color="#000000"><br></font></td>
                </tr>
                <tr>
                    <td colspan=33 height="38" align="center" valign=middle><font color="#000000">LEGENDA: C - Condutor; S - Socorrista; MC - Condutor Manhã; MS - Socorrista Manhã; TC - Condutor Tarde; TS - Socorrista Tarde; D1 - Diálise Sáb. Condutor; D2 - Diálise Sáb. Soc.; DS - Diálise Semanal Socorrista</font></td>
                    <td align="left" valign=middle><font color="#000000"><br></font></td>
                </tr>
                <tr>
                    <td colspan=3 rowspan=4 height="78" align="center" valign=middle><b><font size=3 color="#000000">Maiorca,<br>1 de Fevereiro de 2015</font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td colspan=15 align="center" valign=middle><b><font face="Arial" color="#000000">O Chefe de Equipa de Emergência</font></b></td>
                    <td colspan=10 align="center" valign=middle><b><font face="Arial" color="#000000">O Coordenador</font></b></td>
                </tr>
                <tr>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" size=1 color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" size=1 color="#000000"><br></font></b></td>
                    <td style="border-bottom: 1px solid #000000" colspan=11 rowspan=2 align="center" valign=middle><b><font face="Arial" size=1 color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><font color="#000000"><br></font></td>
                    <td align="left" valign=middle><b><font face="Arial" size=1 color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" size=1 color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" size=1 color="#000000"><br></font></b></td>
                    <td style="border-bottom: 1px solid #000000" colspan=7 rowspan=2 align="center" valign=middle><b><font face="Arial" size=1 color="#000000"><br></font></b></td>
                </tr>
                <tr>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><b><font face="Arial" color="#000000"><br></font></b></td>
                    <td align="left" valign=middle><font face="Arial" size=1 color="#000000"><br></font></td>
                    <td align="left" valign=middle><font face="Arial" size=1 color="#000000"><br></font></td>
                    <td align="left" valign=middle><font face="Arial" size=1 color="#000000"><br></font></td>
                    <td align="left" valign=middle><font face="Arial" size=1 color="#000000"><br></font></td>
                    <td align="left" valign=middle><font face="Arial" size=1 color="#000000"><br></font></td>
                    <td align="left" valign=middle><font face="Arial" size=1 color="#000000"><br></font></td>
                </tr>
                <tr>
                    <td align="center" valign=middle><font color="#000000"><br></font></td>
                    <td align="left" valign=middle><font face="Arial" color="#000000"><br></font></td>
                    <td align="left" valign=middle><font face="Arial" color="#000000"><br></font></td>
                    <td align="left" valign=middle><font face="Arial" color="#000000"><br></font></td>
                    <td align="left" valign=middle><font face="Arial" color="#000000"><br></font></td>
                    <td align="left" valign=middle><font face="Arial" color="#000000"><br></font></td>
                    <td align="left" valign=middle><font face="Arial" color="#000000"><br></font></td>
                    <td align="left" valign=middle><font face="Arial" color="#000000"><br></font></td>
                    <td colspan=15 align="center" valign=middle><b><i><font face="Arial" size=1 color="#000000">(Pedro Reis)</font></i></b></td>
                    <td colspan=10 align="center" valign=middle><b><i><font face="Arial" size=1 color="#000000">(Luis Lopes)</font></i></b></td>
                </tr>
                <tr>
                    <td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000" rowspan=2 height="41" align="center" valign=middle><b><font face="Arial" color="#000000">Notas:</font></b></td>
                    <td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-right: 2px solid #000000" colspan=35 rowspan=2 align="left" valign=middle><b><font face="Arial" color="#000000">A escala está ordenada hirerarquicamente, como tal o graduado de serviço será sempre o que se encontrar numa posição mais elevada</font></b></td>
                </tr>
                <tr>
                </tr>
            </table>



        </div> <!-- Container -->

        <!-- JAVA Script The last element to be loaded, for performance issues -->

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="/static/lib/bootstrap/js/bootstrap.js"></script>

        <script type="text/javascript" src="/static/js/redcross.js" ></script>


    </body>
</html>