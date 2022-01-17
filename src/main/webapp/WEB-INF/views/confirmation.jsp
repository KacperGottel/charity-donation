<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Document</title>
  <link rel="stylesheet" href="/resources/css/style.css" />
</head>
<body>
<header class="header--form-page">
  <nav class="container container--70">
    <ul class="nav--actions">
      <li class="logged-user">
        <sec:authorize access="isAuthenticated()">
          Hi! <sec:authentication property="principal.username" />
        </sec:authorize>
        <ul class="dropdown">
          <li><a href="/user/dashboard">Profil</a></li>
          <li><a href="/user/collection">Moje zbiórki</a></li>
          <li><a href="/logout">Wyloguj</a></li>
        </ul>
      </li>
    </ul>

    <ul>
      <li><a href="/" class="btn btn--without-border active">Start</a></li>
      <li><a href="/#steps" class="btn btn--without-border">O co chodzi?</a></li>
      <li><a href="/#about-us" class="btn btn--without-border">O nas</a></li>
      <li><a href="/#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
      <li><a href="/#contact" class="btn btn--without-border">Kontakt</a></li>
    </ul>
  </nav>

  <div class="slogan container container--90">
    <h2>
      Dziękujemy za przesłanie formularza Na maila prześlemy wszelkie
      informacje o odbiorze.
    </h2>
  </div>
</header>

<%@ include file="/resources/fragment/footer.jsp" %>

