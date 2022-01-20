<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/style.css"/>
</head>
<body>
<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                <sec:authorize access="isAuthenticated()">
                    Hi! <sec:authentication property="principal.username"/>
                </sec:authorize>
                <ul class="dropdown">
                    <li><a href="/user/dashboard">Profil</a></li>
                    <li><a href="/user/dashboard#section2">Moje zbiórki</a></li>
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
            <a href="#help">Lista Fundacji</a><br><br>
            <a href="/institution/add" class="btn btn--highlighted">Dodaj Fundację</a>
        </h2>
    </div>
</header>
<section id="help" class="help">
    <h2>Komu pomagamy?</h2>
    <a href="/institution/add" class="btn btn--without-border">Dodaj Fundację</a>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p>W naszej bazie znajdziesz listę zweryfikowanych Fundacji, z którymi współpracujemy.
            Możesz sprawdzić czym się zajmują.</p>

        <ul class="help--slides-items">
            <c:forEach items="${institutionList}" var="i">
                <li>
                    <div class="col">
                        <div class="title">Fundacja "${i.name}"</div>
                        <div class="subtitle">Cel i misja: ${i.description}</div>
                        <div class="subtitle btn btn--small"><a href="/institution/${i.id}/update">Zaktualizuj</a></div>
                        <div class="subtitle btn btn--small"><a href="/institution/${i.id}/delete">Usuń</a></div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</section>


<%@ include file="/resources/fragment/footer.jsp" %>
