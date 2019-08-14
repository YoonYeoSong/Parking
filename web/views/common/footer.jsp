<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <hr class="featurette-divider">

  <footer class="container py-5">
    <div class="row">
      <div class="col-6 col-md">
        <a class="navbar-brand" href="#">
          <img src="./images/logo_black.png">
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
  <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

  <!-- JS -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  <script>
    /* navigation and main searchbars are toggled
      based on scroll pixel amounts from the top;
      화면을 밑으로 스크롤 했을때, 상단으로 부터의 높이가 200px를 넘으면 hasBeenTriggered의
      값을 true로, 다시 높이가 200px 보다 작도록 위로 스크롤 되면 hasbeenTriggered가 false가
      되도록하여, 상단의 searchbar가 메인 searchbar가 없어졋을때 display 되도록 합니다.
       */
    $(function(){
      /*$('.navbar-toggler').on('hidden.bs.collapse', function () {
        $('#nav-searchbar').attr({'width': '720px'});
      });*/

      // hidden in default
      $('#nav-searchbar').hide();
      var hasBeenTriggered = false;

      $(window).scroll(function(){
        if($(this).scrollTop()>=200 && !hasBeenTriggered){
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

      // prevent flickering when next/prev arrow pressed
      /*
      $("body").on("click", ".carousel-control-prev,.carousel-control-next,.carousel-indicators li, .myCarousel-target", function() {
          var myParent = $('#myCarousel2');
          var target = myParent.find('.carousel-item.active');

          target.css({
              'overflow': 'hidden',
              'height': '50vh'
          }).delay(500)
          .queue(function(next) {
              next();
              myParent.css({
                  'overflow': 'auto',
                  'height': 'auto'
              });
          });
      });*/
    });

  </script>
  
</body>
</html>
