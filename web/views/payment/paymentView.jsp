<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>


<style>
    .site-header {
      background-color: rgba(0, 10, 10, 0.7);
      /* -webkit-backdrop-filter: saturate(180%) blur(20px);
        backdrop-filter: saturate(180%) blur(20px); */
    }

    .site-header a {
      color: #999;
      transition: ease-in-out color .15s;
    }

    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>
  <!-- <link href="pricing.css" rel="stylesheet"> -->


<body>


  <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <ol class="breadcrumb">
          <li><a href="#">Parking</a></li>      
          <li class="active">Payment</li>
        </ol>       
  </div>

  <div class="container">
    <div class="card-deck mb-3 text-center list-group">
      <div class="card shadow-sm">
        <div class="card-header">
          <h4 class="my-0 font-weight-normal">1.REVIEW RESERVATION DETAILS</h4>
        </div>
        <div class="card-body row">
            <ul class="list-unstyled mt-3 mb-4 col-md-6">
                <li class="">30 users included</li>
                <li class="">15 GB of storage</li>
                <li class="">Phone and email support</li>        
            </ul>
  
            <ul class="list-unstyled mt-3 mb-4 col-md-6">
              <li class="">30 users included</li>
              <li class="">15 GB of storage</li>
              <li class="">Phone and email support</li>        
            </ul>
          <!-- <button type="button" class="btn btn-lg btn-block btn-outline-primary">Sign up for free</button> -->
        </div>
      </div>
      <div class="card shadow-sm">
        <div class="card-header">
          <h4 class="my-0 font-weight-normal">2.ACCOUNT INFO</h4>
        </div>
        <div class="card-body row">
            <ul class="list-unstyled mt-3 mb-4 col-md-6">
                <li class="">30 users included</li>
                <li class="">15 GB of storage</li>
                <li class="">Phone and email support</li>        
            </ul>
  
            <ul class="list-unstyled mt-3 mb-4 col-md-6">
              <li class="">30 users included</li>
              <li class="">15 GB of storage</li>
              <li class="">Phone and email support</li>        
            </ul>
          <button type="button" class="btn btn-lg btn-block btn-primary">Get started</button>
        </div>
      </div>
      <div class="card shadow-sm">
        <div class="card-header">
          <h4 class="my-0 font-weight-normal">3.PAYMENT INFO</h4>
        </div>
        <div class="card-body row">
          <ul class="list-unstyled mt-3 mb-4 col-md-6">
              <li class="">30 users included</li>
              <li class="">15 GB of storage</li>
              <li class="">Phone and email support</li>        
          </ul>

          <ul class="list-unstyled mt-3 mb-4 col-md-6">
            <li class="">30 users included</li>
            <li class="">15 GB of storage</li>
            <li class="">Phone and email support</li>        
          </ul>
          <button type="button" class="btn btn-lg btn-block btn-primary">Contact us</button>
        </div>
      </div>
    </div>

  </div>

  
  

</body>

  <%@ include file="/views/common/footer.jsp" %>