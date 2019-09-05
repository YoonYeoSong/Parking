<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-------------------------
'footer.jsp' contains :
  * <footer> element
-------------------------->

  <hr class="featurette-divider">

  <footer class="container py-0">
    <div class="row">
      <div class="col-6 col-md">
        <a class="navbar-brand " href="<%=request.getContextPath()%>" >
          <img src="<%=request.getContextPath() %>/images/logo_black.png">
        </a>
        <small class="d-block mb-3 text-muted">&copy; 2019.09</small>
      </div>
      <div class="col-6 col-md">
      <p class='h5'>District</p>
      <ul class="list-unstyled text-small">
        <li><a class="text-muted" href="#">Seocho-gu</a></li>
        <li><a class="text-muted" href="#">Seodaemun-gu</a></li>
        <li><a class="text-muted" href="#">Seongbuk-gu</a></li>
        <li><a class="text-muted" href="#">Seongdong-gu</a></li>
        <li><a class="text-muted" href="#">Songpa-gu</a></li>
        <li><a class="text-muted" href="#">Yangcheon-gu</a></li>
      </ul>
      </div>
      <div class="col-6 col-md">
      <p class='h5'>Help</p>
      <ul class="list-unstyled text-small">
        <li><a class="text-muted" href="#">Resource</a></li>
        <li><a class="text-muted" href="#">Resource name</a></li>
        <li><a class="text-muted" href="#">Another resource</a></li>
        <li><a class="text-muted" href="#">Final resource</a></li>
      </ul>
      </div>
      <div class="col-6 col-md">
      <p class='h5'>About</p>
      <ul class="list-unstyled text-small">
        <li><a class="text-muted" href="#">Team</a></li>
        <li><a class="text-muted" href="#">Locations</a></li>
        <li><a class="text-muted" href="#">Privacy</a></li>
        <li><a class="text-muted" href="#">Terms</a></li>
      </ul>
      </div>
      <div class="col-6 col-md">
      <p class='h5'>Contact Us</p>
      <ul class="list-unstyled text-small">
        <li><a class="text-muted" href="#">010-1234-1234</a></li>
        <li><a class="text-muted" href="#">120 East 12th Street, Manhattan, 1003, NY USA</a></li>
        <li>
          <div class="row social-list">
            <div class="col-sm-3 col-xs-2 col-sm-offset-0 col-xs-offset-2 px-0">
              <a href="" class="">
                <span class="fa-stack fa-lg" href="">
                  <i class="fa fa-linkedin fa-stack-1x"></i>
                </span>
              </a>
            </div>
            <div class="col-sm-3 col-xs-2 px-0">
              <a href="" class="">
                <span class="fa-stack fa-lg">
                  <i class="fa fa-instagram fa-stack-1x"></i>
                </span>
              </a>
            </div>
            <div class="col-sm-3 col-xs-2 px-0">
              <a href="" class="">
                <span class="fa-stack fa-lg">
                  <i class="fa fa-twitter fa-stack-1x"></i>
                </span>
              </a>
            </div>
            <div class="col-sm-3 col-xs-2 px-0">
              <a href="" class="">
                <span class="fa-stack fa-lg">
                  <i class="fa fa-facebook-official fa-stack-1x"></i>
                </span>
              </a>
            </div>
          </div>
        </li>
      </ul>
      </div>
    </div>
  </footer>

</body>
</html>
