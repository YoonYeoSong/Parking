<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,java.util.ArrayList, com.parking.member.model.vo.Member"%>

<%
  List<Member> members=(ArrayList<Member>)request.getAttribute("members");
  int cPage=(int)request.getAttribute("cPage");
  int numPerPage=(int)request.getAttribute("numPerPage");
  String pageBar = (String)request.getAttribute("pageBar");
	String searchType=(String)request.getAttribute("searchType");
	String searchKeyword=(String)request.getAttribute("searchKeyword");
%>

<%@ include file="/views/common/mypageHeader.jsp" %>
  <style>
    #search-email{display: inline-block;}
    #search-user_Name{display: none;}
  </style>

  <div class="container" id="memberList-wrapper">
    <section class="py-4" id="memberList-container">
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
      <script>
        $(function(){
          var sEmail=$("#search-email");
          var sUserName=$("#search-user_Name");
          var searchType=$("#searchType"); //<select>
  
          searchType.change(function(){ //add 'change' event on searchType <select>
            sEmail.hide();
            sUserName.hide();
            $('#search-' + this.value).css("display", "inline-block");
          });
          searchType.trigger("change"); // trigger change event
        });
      </script>
      <table class="table">
        <thead>
          <tr>
            <th scope="col">NO.</th>
            <th scope="col">User#</th>
            <th scope="col">Email</th>
            <th scope="col">Name</th>
            <th scope="col">Created</th>
            <th scope="col">Logged</th>
            <th scope="col">SMS(Y/N)</th>
            <th scope="col">Email(Y/N)</th>
            <th scope="col">Email Verified(Y/N)</th>
            <th scope="col">SNS account</th>
          </tr>
        </thead>
        <tbody>
        <% if(members != null && !members.isEmpty()) {
          int count =0;
          for(Member m : members){ %>
            <tr>
              <th scope="row"><%= (cPage-1) * numPerPage + (++count)%></th>
              <td>
                <a href="#">
                  <%=m.getUserCode() %>
                </a>
              </td>
              <td><%=m.getUserEmail() %></td>
              <td><%=m.getUserName() %></td>
              <td><%=m.getUserCreatedDate() %></td>
              <td><%=m.getUserLoginDate() %></td>
              <td><%=m.getUserSmsYn()==1? 'Y':'N' %></td>
              <td><%=m.getUserEmailYn()==1? 'Y':'N' %></td>
              <td><%=m.getUserEmailVerified()==1? 'Y':'N' %></td>
              <td><%=m.getUserSnsAccount() %></td>
            </tr>
        <% } } %>
        </tbody>
      </table>
      
      <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
          <%=pageBar %>
        </ul>
      </nav>
    </section>
  </div>

  <script>
    function ajaxRequestPage(pageNo){
      var url = "<%=request.getContextPath() %>/admin/memberList?cPage=" + pageNo;
      $.ajax({
        type: "POST",
        url: url,
        dataType: "html",
        success: function(data){
          html = $('<div>').html(data);
          console.log(html);
          console.log(html.find('section#memberList-container'));
          // var tag = $("<h3>").html(data).css("color", "blue");
          // $('#content').append(tag);
          // $('#qna_table tbody')
            // location.href="<%=request.getContextPath() %>/board/qnaBoardList?cPage=" + pageNo;

            $('div#memberList-wrapper').html(html.find('section#memberList-container'));
        },
        error: function(request, status, error){
          console.log("error 함수 실행!");
          console.log(request);
          console.log(status);
          console.log(error);
        },
      });
    }
  </script>

<%@ include file="/views/common/mypageFooter.jsp" %>