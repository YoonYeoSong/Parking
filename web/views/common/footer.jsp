<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-------------------------
'footer.jsp' contains :
  * JS / JQuery link
  * JS code
  * <footer> element
-------------------------->

  <hr class="featurette-divider">

  <footer class="container py-0">
    <div class="row">
      <div class="col-6 col-md">
        <a class="navbar-brand " href="<%=request.getContextPath() %>/index.jsp">
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

  <!-- jQuery -->
  <!-- <script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script> -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

  <!-- JS -->
  <!-- <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script> -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <!-- trigger google btn click -->
  <script src="https://apis.google.com/js/platform.js?onload=onLoadGoogleCallback" async defer></script>

  <script>
    /*
      navigation and main searchbars are toggled
      based on scroll pixel amounts from the top;
    */
    $(function(){
      /*$('.navbar-toggler').on('hidden.bs.collapse', function () {
        $('#nav-searchbar').attr({'width': '720px'});
      });*/

      // hidden by default
      $('#nav-searchbar').hide();
      var hasBeenTriggered = false;

      $(window).scroll(function(){
        if($(this).scrollTop()>=280 && !hasBeenTriggered){
          hasBeenTriggered = true;
          $('#nav-searchbar').fadeToggle();
          $('#main-searchbar').fadeToggle();
        }
        else if($(this).scrollTop()<200 && hasBeenTriggered){
          hasBeenTriggered = false;
          $('#nav-searchbar').fadeToggle();
          $('#main-searchbar').fadeToggle();
        }
      });
    });

    function onLoadGoogleCallback(){
      gapi.load('auth2', function() {
        auth2 = gapi.auth2.init({
          client_id: '847270498494-dj5o04t83q5uja6ccp6eekr3en7qcb8p.apps.googleusercontent.com',
          cookiepolicy: 'single_host_origin',
          scope: 'profile'
        });

        auth2.attachClickHandler(element, {},
          function(googleUser) {
            var profile = googleUser.getBasicProfile();
            console.log("ID: " + profile.getId()); // Don't send this directly to your server!
            console.log('Full Name: ' + profile.getName());
            console.log('Given Name: ' + profile.getGivenName());
            console.log('Family Name: ' + profile.getFamilyName());
            console.log("Image URL: " + profile.getImageUrl());
            console.log("Email: " + profile.getEmail());
            
            var id_token = googleUser.getAuthResponse().id_token;
            console.log("ID Token: " + id_token);

            $('#myImg').attr({"src": profile.getImageUrl(),
                              "style": "width:31px; heght:31px"});
            // document.getElementById("myImg").src = profile.getImageUrl();
            document.getElementById("name").innerHTML = "Hello! " + profile.getName();
            $('#googleLotoutBtn').toggle();

            //document.getElementById("status").innerHTML = 'Welcome '+name+"!<a href=success.jsp?email='+email+'&name='+name+'/>Continue with Google login</a></p>";
            // document.getElementById("status").innerHTML = 'Hello! '+name;
            // var googleUserEntity = {};
            // googleUserEntity.Id = profile.getId();
            // googleUserEntity.Name = profile.getName();
            
            // //Store the entity object in sessionStorage where it will be accessible from all pages of your site.
            // sessionStorage.setItem('googleUserEntity',JSON.stringify(googleUserEntity));
            // if(sessionStorage.getItem('googleUserEntity') == null){
            //   //Redirect to login page, no user entity available in sessionStorage
            //   // window.location.href='Login.html';
            //   console.log("google logged out");
            //   $('#googleLogoutBtn').hide();
            // } else {
            //   //User already logged in
            //   console.log("google logged in");
            //   googleUserEntity = JSON.parse(sessionStorage.getItem('googleUserEntity'));
            // }
          },
          function(error) {
            console.log('Sign-in error', error);
          }
        );
      });

      element = document.getElementById('googleSignIn');
    }
    function googleLogout() {
      gapi.auth2.getAuthInstance().disconnect();
      sessionStorage.clear();
      $('#googleLotoutBtn').toggle();
      location.reload();
    }
    function validate(){
    	if($('#email').val().length==0){
        alert("Please type Email for login");
        $('#email').focus();
        return false; //prevent form submit
      }
    	if($('#pw').val().length==0){
        alert("Please type Password for login");
        $('#pw').focus();
        return false; //prevent form submit
      }
    	return true;
    }
    function googleLogin(){
      $( "#googleBtn" ).trigger( "click" );
    }
  </script>
  
</body>
</html>
