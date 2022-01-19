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
    <br><br><br><br><br><br>
    <div class="container container--85">
        <h2>
            <a href="#formDonation">Aktualizacja daru</a><br><br>
            <a href="/user/dashboard" class="btn btn--highlighted">Wróć</a>

        </h2>
    </div>
</header>
<section id="formDonation">
    <div class="container container--85">
        <h2>
            <div class="contact" id="contact">
                <form:form modelAttribute="donation" method="post" action="/donation/update">
                    <form:hidden path="id"/><form:hidden path="user"/>
                    <div class="form-group form-group--50">Ilość worków: <form:input path="quantity" type="number"/></div>
                    <div class="form-group form-group--50">Kategoria: <form:select path="categories" items="${categories}"
                                                                            itemLabel="name"/></div>
                    <div class="form-group form-group--50">Fundacja: <form:select path="institution" items="${institutions}"
                                                                            itemLabel="name"/></div>
                    <div class="form-group form-group--50">Ulica: <form:input path="street" type="text"/></div>
                    <div class="form-group form-group--50">Miasto: <form:input path="city" type="text"/></div>
                    <div class="form-group form-group--50">Kod pocztowy: <form:input path="zipCode" type="text"/></div>
                    <div class="form-group form-group--50">Data odbioru:<form:input path="pickUpDate" type="date"/></div>
                    <div class="form-group form-group--50">Godzina odbioru: <form:input path="pickUpTime" type="time"/></div>
                    <div class="form-group form-group--50">Komentarz: <form:input path="pickUpComment" type="text"/></div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="form-group form-group--inline">
                        <button class="btn" type="submit">Aktualizuj</button>
                    </div>
                </form:form>
                <br>
            </div>
        </h2>
    </div>
    <h2>
        <c:choose>
        <c:when test="${not empty infoStatus}">
            ${infoStatus}
        </c:when>
            <c:otherwise>
            <form:form method="post" modelAttribute="status" action="/status/update">
        <form:hidden path="id"/><form:hidden path="donation"/>
        <div class="form-group form-group--inline">Data dostarczenia: <form:input path="deliveryDate" type="date"/></div>
        <div class="form-group form-group--50">Czy dostarczono?: <form:checkbox path="delivered"/></div>
        <div class="form-group form-group--50">Czy odebrano?: <form:checkbox path="pickedUp"/></div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="form-group form-group--inline">
            <button class="btn" type="submit">Aktualizuj</button>
        </div>
    </form:form>
            </c:otherwise>
        </c:choose>
    </h2>
</section>

<%@ include file="/resources/fragment/footer.jsp" %>
