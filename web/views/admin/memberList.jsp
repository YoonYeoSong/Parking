<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,java.util.ArrayList, com.parking.member.model.vo.Member"%>

<%
List<Member> members=(ArrayList<Member>)request.getAttribute("members");
  int cPage=(int)request.getAttribute("cPage");
	String searchType=(String)request.getAttribute("searchType");
	String searchKeyword=(String)request.getAttribute("searchKeyword");
%>

<%@ include file="/views/common/mypageHeader.jsp" %>
  <style>
    #search-email{display: inline-block;}
    #search-user_Name{display: none;}
  </style>

  <section id="memberList-container">
    <h2>Member List</h2>
    <div id="neck-container">
      <div id="search-container">
        SEARCH TYPE : 
        <select id="searchType">
          <option value="email" <%="email".equals(searchType)?"selected":"" %>>Email</option>
          <option value="user_Name" <%="user_Name".equals(searchType)?"selected":"" %>>UserName</option>
        </select>
        <div id="search-email">
          <form action="<%=request.getContextPath() %>/admin/memberFinder">
            <input type="hidden" name="searchType" value="email"/>
            <input type="hidden" name="cPage" value="<%=cPage%>"/>
            <input type="text" placeholder="Search Email" name="searchKeyword"
                   value='<%="email".equals(searchType)? searchKeyword:"" %>' size="25"/>
            <button type="submit" class="btn btn-primary">SEARCH</button>
          </form>
        </div>
        <div id="search-user_Name">
          <form action="<%=request.getContextPath() %>/admin/memberFinder">
            <input type="hidden" name="searchType" value="user_Name"/>
            <input type="hidden" name="cPage" value="<%=cPage%>"/>
            <input type="text" placeholder="Search User Name" name="searchKeyword"
                   value='<%="user_Name".equals(searchType)? searchKeyword: ""%>' size="25"/>
            <button type="submit" class="btn btn-primary">SEARCH</button>
          </form>
        </div>
      </div>
    </div>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">User Code</th>
          <th scope="col">Email</th>
          <th scope="col">Phone</th>
          <th scope="col">UserName</th>
          <th scope="col">Address</th>
          <th scope="col">Created Date</th>
          <th scope="col">Login Date</th>
          <th scope="col">Receive SMS(Y/N)</th>
          <th scope="col">Receive Email(Y/N)</th>
          <th scope="col">Email Verified(Y/N)</th>
        </tr>
      </thead>
      <tbody>
      <% if(members != null && !members.isEmpty()) {
        int count =0;
        for(Member m : members){ %>
          <tr>
            <th scope="row"><%=(++count)%></th>
            <td><%=m.getUserCode() %></td>
            <td><%=m.getEmail() %></td>
            <td><%=m.getPhone() %></td>
            <td><%=m.getUserName() %></td>
            <td><%=m.getUserAddr() %></td>
            <td><%=m.getCreatedDate() %></td>
            <td><%=m.getLoginDate() %></td>
            <td><%=m.isSmsYn()==1? 'Y':'N' %></td>
            <td><%=m.isEmailYn()==1? 'Y':'N' %></td>
            <td><%=m.isSmsYn()==1? 'Y':'N' %></td>
            <td><%=m.isEmailVerified()==1? 'Y':'N' %></td>
          </tr>
      <% } } %>
      </tbody>
    </table>
    
    <div id="pageBar" style="text-align: center;">
      <%=request.getAttribute("pageBar") %>
    </div>
  </section>


<%@ include file="/views/common/mypageFooter.jsp" %>