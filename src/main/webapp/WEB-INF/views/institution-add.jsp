<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Charity</title>
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
<br><br><br><br><br><br>
    <div class="container container--85">
        <h2>
            <a href="#form">Formularz dodawania Fundacji</a><br><br>
            <a href="/institution/list" class="btn btn--highlighted">Wróć</a><br><br><br><br><br><br><br><br><br><br>
        <div class="contact" id="contact">
            <form:form class="form--contact" modelAttribute="institution" method="post">
                <form:hidden path="id"/>
                <div class="form-group form-group--50"><form:input path="name" type="text"  placeholder="Nazwa Fundacji"/></div>
                <div class="form-group form-group--50"><form:input path="description" type="textarea"  placeholder="Opis"/></div>
                <button class="btn" type="submit">Wyślij</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form:form>
        </div>
        </h2>
    </div>
</header>

<%@ include file="/resources/fragment/footer.jsp" %>
