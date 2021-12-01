<%@page import="vo.Detail_optionVO"%>
<%@page import="dao.Main_optionDAO"%>
<%@page import="dao.Detail_optionDAO"%>
<%@page import="vo.CityVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AreaDAO"%>
<%@page import="dao.CityDAO"%>
<%@page import="vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="../css/header.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../js/header.js"></script>
    <header>
        <div class="header_logo"><a href="mainPage.jsp"><img src="../images/headerImages/logo.png" alt=""></a></div>
        <nav>
            <ul class="mainMenu mouseleave">
                <li rel="area_tab" class="set_area"><a href="">지역</a></li>
                <li rel="travel_tab"><a href="">여행가자</a></li>
                <li rel="food_tab"><a href="">맛집가자</a></li>
                <li rel="enjoy_tab"><a href="">놀러가자</a></li>
            </ul>
        </nav>
        <div class="header_icon">
	       	<%
	       		Object obj = session.getAttribute("vo");
	       		if(obj != null){
	       		
	        %>
	        	<a href="myPage.jsp"><img class="mypage_icon" src="../images/headerImages/mypage_icon.png" alt=""></a>
	        <%
	       		}else{
	        %>
	        	<a href="loginAndJoin.jsp"><img class="mypage_icon" src="../images/headerImages/mypage_icon.png" alt=""></a>
	        <%
	       		}
	        %>          
            <a href=""><img class="search_icon" src="../images/headerImages/search_icon.png" alt=""></a> 
        </div>
    </header>
    
    <div class="subMenu mouseleave">
        <div id="area_tab" class="tab_thema mouseleave">
        <%
        	CityDAO city_dao = new CityDAO();
        	AreaDAO area_dao = new AreaDAO();
        	ArrayList<CityVO> list = city_dao.selectAll();
        	CityVO vo = new CityVO();
        	int this_area_no = 0;
        %>
            <ul class="list">
				<%
					try{
					for(int i = 0; i <list.size();){
						vo = list.get(i);
				%>             
            	<li><a href=""><%=area_dao.getTerritorial(vo.getArea_no())%></a>	<% this_area_no = vo.getArea_no(); %>
            		<ul class="detail_thema area">
            			<%
            				do{
            			%>
            			<li>
            				<a href="#" id="<%=vo.getCity_no()%>"><%=vo.getCity_name() %></a>
            			</li>
            			<% i++;  vo = list.get(i);%>
            			<%
            				}while(this_area_no == vo.getArea_no());
            			%>
            		</ul>
            	</li>
            	<%
					}
					}catch(IndexOutOfBoundsException iobe){}
            	%>               
            </ul>
        </div>

        <%
        	Detail_optionDAO detail_dao = new Detail_optionDAO();
        	Detail_optionVO option_vo = new Detail_optionVO();
        	Main_optionDAO main_dao = new Main_optionDAO();
        	int this_option_no = 0;
        %>
        <div id="travel_tab" class="tab_thema mouseleave">
            <ul class="list">
            	<%
            		ArrayList<Detail_optionVO> option_list = detail_dao.selectAll(1);
            		try{
            		for(int i = 0; i < option_list.size();){
            			option_vo = option_list.get(i);
            	%>
            		<li><a href=""><%=main_dao.getOption_name(option_vo.getOption_no()) %></a> <% this_option_no = option_vo.getOption_no(); %>
            			<ul class="detail_thema menuTab">
            				<%
            					do{
							%>
								<li><a href="#" id="<%=option_vo.getDetail_option_no()%>"><%=option_vo.getDetail_option_name() %></a></li> <% i++; option_vo = option_list.get(i); %>
							<%            						
            					}while(option_vo.getOption_no() == this_option_no);
            				%>
            			</ul>
            		</li>
            	<%		
            		}
            		}catch(IndexOutOfBoundsException iobe){}
            	%>
            </ul>
        </div> 
        
        <div id="food_tab" class="tab_thema mouseleave">
            <ul class="list">
          	  <%
            		ArrayList<Detail_optionVO> option_list2 = detail_dao.selectAll(2);
            		int cnt = 1;
            		try{
            		for(int i = 0; i < option_list2.size();){
            			option_vo = option_list2.get(i);
            	%>
            		<li><a href=""><%=main_dao.getOption_name(option_vo.getOption_no()) %></a> <% this_option_no = option_vo.getOption_no(); %>
            			<ul class="detail_thema menuTab">
            				<%
            					do{
            						if(cnt > 3){
							%> 
									<li class="lineout"><a href="#"  id="<%=option_vo.getDetail_option_no()%>"><%=option_vo.getDetail_option_name() %></a></li> <% cnt++; i++; option_vo = option_list2.get(i); %>
							<%
            						}else{
							%>
									<li><a href="#"  id="<%=option_vo.getDetail_option_no()%>"><%=option_vo.getDetail_option_name() %></a></li> <% cnt++; i++; option_vo = option_list2.get(i); %>
							<%            
            						}
            					}while(option_vo.getOption_no() == this_option_no);
            					cnt = 1;
            				%>
            			</ul>
            		</li>
            	<%		
            		}
            		}catch(IndexOutOfBoundsException iobe){}
            	%>
            </ul>
        </div>

        <div id="enjoy_tab" class="tab_thema mouseleave">
            <ul class="list">
            	<%
            		cnt = 1;
            		ArrayList<Detail_optionVO> option_list3 = detail_dao.selectAll(3);
            		try{
            		for(int i = 0; i < option_list3.size();){
            			option_vo = option_list3.get(i);
            	%>
            		<li><a href=""><%=main_dao.getOption_name(option_vo.getOption_no()) %></a> <% this_option_no = option_vo.getOption_no(); %>
            			<ul class="detail_thema menuTab">
            				<%
            					do{
            						if(cnt > 4){
							%> 
									<li class="lineout2"><a href="#" id="<%=option_vo.getDetail_option_no()%>"><%=option_vo.getDetail_option_name() %></a></li> <% cnt++; i++; option_vo = option_list3.get(i); %>
							<%
            						}else{
							%>
									<li><a href="#"  id="<%=option_vo.getDetail_option_no()%>"><%=option_vo.getDetail_option_name() %></a></li> <% cnt++; i++; option_vo = option_list3.get(i); %>
							<%            
            						}
            					}while(option_vo.getOption_no() == this_option_no);
            					cnt = 1;
            				%>
            			</ul>
            		</li>
            	<%		
            		}
            		}catch(IndexOutOfBoundsException iobe){}
            		
            		area_dao.close();
            		city_dao.close();
            		detail_dao.close();
            		main_dao.close();
            		
            	%>
            </ul>
        </div>
    </div>