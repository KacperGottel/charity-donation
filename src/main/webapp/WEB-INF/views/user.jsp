<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <a href="#section1">Twoje dane</a>
            |
            <a href="#section2">Lista darów</a><br>
        </h2>

    </div>
</header>
<section id="section1">
    <div class="container container--85">
        <h2>
            <h class="contact" id="contact">
                <form:form method="post" modelAttribute="userlogged" class="form--contact">
                    <form:hidden path="id"/>
                <div class="form-group form-group--50">Email: <form:input path="email" placeholder="Email"
                                                                          type="email"/><form:errors
                        path="email"/></div>
                <div class="form-group form-group--50">Login: <form:input path="username" placeholder="Login"
                                                                          type="text"/><form:errors
                        path="username"/></div>
                <div class="form-group form-group--10">Hasło: <form:input path="password" placeholder="Password"
                                                                          type="password"/><form:errors
                        path="password"/></div>
                <div class="form-group form-group--50">Twoja
                    rola: <span style="color: gray">${userlogged.role.name.toLowerCase().substring(5)}</span><input></div>
                <div class="form-group form-group--50">Status konta:
                    <span style="color: gray">           <c:choose>
                        <c:when test="${userlogged.enabled}">
                            aktywny
                        </c:when>
                        <c:otherwise>
                            zablokowany
                        </c:otherwise>
                    </c:choose>
                    </span>
                        <input>
                </div>
                <div class="form-group form-group--inline">
                    <button class="btn" type="submit">Aktualizuj</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form:form>
        </h2>
        <div style="border-bottom: 4px solid black;"><br></div>
        <div id="section2">
            <ol>
                <c:forEach items="${userlogged.donations}" var="d">
                    <h1>
                        <li class="details-list">
                            <span style="font-family: Arial; color: rgb(72,70,70); background-color: palegoldenrod">Fundacja:</span> ${d.institution.name}<br>
                            <span style="font-family: Arial; color: #484646;  background-color: palegoldenrod">Kategoria:</span> ${d.categories.get(0).name}<br>
                            <span style="font-family: Arial; color: #484646;  background-color: palegoldenrod">Ilość:</span> ${d.quantity}<br>
                            <span style="font-family: Arial; color: #484646;  background-color: palegoldenrod">Miasto:</span> ${d.city}<br>
                            <span style="font-family: Arial; color: #484646;  background-color: palegoldenrod">Ulica:</span> ${d.street}<br>
                            <span style="font-family: Arial; color: #484646;  background-color: palegoldenrod">Kod pocztowy:</span> ${d.zipCode}<br>
                            <span style="font-family: Arial; color: #484646;  background-color: palegoldenrod">Data:</span> ${d.pickUpDate}<br>
                            <span style="font-family: Arial; color: #484646;  background-color: palegoldenrod">Godzina:</span> ${d.pickUpTime}<br>
                            <span style="font-family: Arial; color: #484646;  background-color: palegoldenrod">Komentarz:</span> ${d.pickUpComment}<br>
                        </li>
                    </h1>
                    <h2>
                        <div class="btn"><a href="/donation/${d.id}/update">Wprowadź zmiany</a></div>
                        <div class="btn"><a href="/donation/${d.id}/delete" style="color: red">Usuń</a></div>
                    </h2>
                </c:forEach>
            </ol>
        </div>
        <wbr>
        <h1>
            <div style="text-align: center">
                <a href="user/delete" class="btn btn--without-border" style="background-color: red"><span
                        style="color: white">Usuń konto</span></a>
            </div>
        </h1><br>
    </div>
    </div>
</section>

<%@ include file="/resources/fragment/footer.jsp" %>

