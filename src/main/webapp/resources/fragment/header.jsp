<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge" charset="UTF-8"/>
    <title>Charity</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="/login" class="btn btn--small btn--without-border"><spring:message code="log" text="default"/></a></li>
            <li><a href="/register" class="btn btn--small btn--highlighted"><spring:message code="reg" text="default"/></a></li>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active"><spring:message code="start" text="default"/></a></li>
            <li><a href="#steps" class="btn btn--without-border"><spring:message code="going" text="default"/></a></li>
            <li><a href="#about-us" class="btn btn--without-border"><spring:message code="about" text="default"/></a></li>
            <li><a href="#help" class="btn btn--without-border"><spring:message code="inst" text="default"/></a></li>
            <li><a href="/form" class="btn btn--without-border"><spring:message code="givedonation" text="default"/></a></li>
            <li><a href="#contact" class="btn btn--without-border"><spring:message code="contact" text="default"/></a></li>
            <li><a href="/user/dashboard" class="btn btn--without-border"><spring:message code="profile" text="default"/></a></li>
        </ul>
        <div>
            <span><spring:message code="lang.change" text="default"/></span>:
            <select id="locales">
                <option value=""></option>
                <option value="eng"><spring:message code="lang.eng" text="default"/></option>
                <option value="pl"><spring:message code="lang.pl" text="default"/></option>
            </select>
        </div>
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                <spring:message code="greeting" text="default"/><br/>
            </h1>
        </div>
    </div>
</header>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#locales").change(function () {
            var selectedOption = $('#locales').val();
            if (selectedOption != ''){
                window.location.replace('international?lang=' + selectedOption);
            }
        });
    });
</script>