<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>

<%@ include file="/resources/fragment/header.jsp" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">

        <div class="form--steps-counter">Krok <span>1</span>/4</div>
        <form:form modelAttribute="donation" action="/form" method="post">
        <!-- STEP 1: class .active is switching steps -->
        <div data-step="1" class="active">
            <h3>Zaznacz co chcesz oddać:</h3>

            <c:forEach items="${categoriesList}" var="cat">
                <div class="form-group form-group--checkbox">
                    <label>
                        <form:radiobutton value="${cat}" path="categories" class="catRadioIn"/>
                        <span class="checkbox"></span>
                        <span class="description">
                                <div class="title">${cat.name}</div>
                            </span>
                    </label>
                </div>
            </c:forEach>

            <div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

        </div>

        <!-- STEP 2 -->
        <div data-step="2">
            <h3>Podaj liczbę worków, w które spakowałeś/aś rzeczy:</h3>

            <div class="form-group form-group--inline">
                <label>
                    Liczba worków:
                    <form:input type="number" path="quantity" step="1" min="1" id="quantity"/>
                    <form:errors path="quantity" element="div"/>
                </label>
            </div>
            <div class="form-group form-group--buttons">
                <button type="button" class="btn prev-step">Wstecz</button>
                <button type="button" class="btn next-step" id="dalejquantity">Dalej</button>
            </div>
        </div>
        <!-- STEP 3 -->
        <div data-step="3">
            <h3>Wybierz organizacje, której chcesz pomóc:</h3>

            <c:forEach items="${institutionsList}" var="ins">
                <div class="form-group form-group--checkbox">
                    <label>
                        <form:radiobutton path="institution" value="${ins}" class="instRadioIn"/>
                        <span class="checkbox radio"></span>
                        <span class="description">
                  <div class="title">Fundacja ${ins.name}</div>
                  <div class="subtitle">
                    Cel i misja: ${ins.description}.
                  </div>
                </span>
                    </label>
                </div>
            </c:forEach>
            <div class="form-group form-group--buttons">
                <button type="button" class="btn prev-step">Wstecz</button>
                <button type="button" class="btn next-step">Dalej</button>
            </div>
        </div>

        <!-- STEP 4 -->
        <div data-step="4">
            <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

            <div class="form-section form-section--columns">
                <div class="form-section--column">
                    <h4>Adres odbioru</h4>
                    <div class="form-group form-group--inline">
                        <label> Ulica <form:input path="street" id="street"/>
                            <form:errors path="street"/> </label>
                    </div>

                    <div class="form-group form-group--inline">
                        <label> Miasto <form:input path="city" id="city"/>
                            <form:errors path="city"/></label>
                    </div>

                    <div class="form-group form-group--inline">
                        <label>
                            Kod pocztowy <form:input path="zipCode" maxlength="6" id="zipCode"/>
                            <form:errors path="zipCode"/>

                        </label>
                    </div>

                </div>

                <div class="form-section--column">
                    <h4>Termin odbioru</h4>
                    <div class="form-group form-group--inline">
                        <label> Data <form:input type="date" path="pickUpDate" id="pickUpDate"/>
                            <form:errors path="pickUpDate"/>
                        </label>
                    </div>

                    <div class="form-group form-group--inline">
                        <label> Godzina
                            <form:input type="time" path="pickUpTime" id="pickUpTime"/>
                            <form:errors path="pickUpTime"/>
                        </label>
                    </div>
                    <div class="form-group form-group--inline">
                        <label>
                            Uwagi dla kuriera
                            <form:textarea path="pickUpComment" id="pickUpComment"/>
                            <form:errors path="pickUpComment"/>
                        </label>
                    </div>
                </div>
            </div>
            <button class="form-group form-group--buttons">
                <button type="button" class="btn prev-step">Wstecz</button>
                <button type="button" class="btn next-step btn--highlighted" id="dalejaddress">Dalej</button>
            </button>
        </div>


        <!-- STEP 6 -->
        <div data-step="5">
            <h3>Podsumowanie Twojej darowizny</h3>

            <div class="summary">
                <div class="form-section">
                    <h4>Oddajesz:</h4>
                    <ul>
                        <li>
                            <span class="icon icon-bag"></span>
                            <span class="summary--text" id="bagsquantityOUT">
                                </span>
                        </li>

                        <li>
                            <span class="icon icon-hand"></span>
                            <span class="summary--text" id="yyy"></span
                            >
                        </li>
                    </ul>
                </div>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru:</h4>
                        <ul>
                            <li  id="streetLI">Prosta 51</li>
                            <li id="cityLI">Warszawa</li>
                            <li id="zipCodetLI">99-098</li>
                        </ul>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru:</h4>
                        <ul>
                            <li id="pUdateLI">13/12/2018</li>
                            <li id="pUtimetLI">15:40</li>
                            <li id="pUcommLI">Brak uwag</li>
                        </ul>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </div>
            </div>
            </form:form>
        </div>
</section>

<%@ include file="/resources/fragment/footer.jsp" %>
