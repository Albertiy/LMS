<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Header&middot;OnlineBankSystem</title>
        <link rel="icon" href="${pageContext.request.contextPath}/assets/img/OnlineBankICO.png">
        <!-- Styles -->
        <link href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/bootstrap/navbar-header.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navbar -->
        <nav id="top_navbar" class="navbar navbar-inverse  navbar-fixed-top">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">Online Bank</a>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a id="home" href="home.jsp">Home</a></li>
                <li><a id="about" href="about.jsp">About</a></li>
                <li><a id="contact" href="contact.jsp">Contact</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a id="loginin" href="loginin.jsp">Login In/Sign Up</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Style<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                      <li><a id="typical" onclick="" role="button">Typical</a></li>
                      <li><a id="night" onclick="" role="button">Night</a></li>
                  </ul>
                </li>
            </ul>
          </div>
        </div>
      </nav>
    </body>
</html>