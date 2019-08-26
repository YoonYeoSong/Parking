<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,java.util.ArrayList, com.parking.member.model.vo.Member"%>

<%@ include file="/views/common/mypageHeader.jsp" %>

<%
	List<Member> members=(ArrayList<Member>)request.getAttribute("members");
	int cPage=(int)request.getAttribute("cPage");
	String searchType=(String)request.getAttribute("searchType");
	String searchKey=(String)request.getAttribute("searchKeyword");
%>
<section id="memberList-container">
  <h2>회원관리</h2>
  <div id="neck-container">
    <div id="search-container">
      SEARCH TYPE : 
      <select id="searchType">
        <option value="email" <%="email".equals(searchType)?"selected":"" %>>Email</option>
        <option value="userName" <%="userName".equals(searchType)?"selected":"" %>>UserName</option>
      </select>
      <div id="search-email">
        <form action="<%=request.getContextPath() %>/admin/memberFinder">
          <input type="hidden" name="searchType" value="userId"/>
          <input type="hidden" name="cPage" value="<%=cPage%>"/>
          <input type="email" placeholder="Search Email" 
          name="searchKeyword" value='<%="userId".equals(searchType)?searchKey:""%>'
          size="25"/>
          <button type="submit">SEARCH</button>
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
        <th scope="col">Name</th>
        <th scope="col">Address</th>
        <th scope="col">Created Date</th>
        <th scope="col">Recent Login</th>
        <th scope="col">Receive SMS</th>
        <th scope="col">Receive Email</th>
        <th scope="col">Email Verified</th>
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
          <td><%=m.isSmsYn() %></td>
          <td><%=m.isEmailYn() %></td>
          <td><%=m.isEmailVerified() %></td>
        </tr>
    <% }
    } %>
    </tbody>
  </table>
  
  <div id="pageBar">
    <%=request.getAttribute("pageBar") %>
  </div>
</section>

  <script>
    var smail=$("#search-email");
    var sname=$("#search-userName");
    var searchType=$("#searchType"); //<select>
  </script>

<%@ include file="/views/common/mypageFooter.jsp" %>