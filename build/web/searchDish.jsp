<%-- 
    Document   : searchDish
    Created on : Oct 22, 2024, 11:17:05 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/search.css">
        <title>Search Dish</title>
    </head>

    <body>
        <%
    // Lấy `tableID` từ `session`
    String tableID = (String) session.getAttribute("tableID");
        %>
        
        <h1>Result for: ${param.query}</h1>
        <a href="dish?tableID=${tableID}" class="btn btn-secondary" style="font-size: 24px"  >Menu</a>
        <h2>You are ordering for table : <%= tableID %></h2>
        <c:choose>
            <c:when test="${empty searchResults}">
                <p>Not found.</p>
            </c:when>
            <c:otherwise> 
                <table border="1">
                    <thead>
                        <tr>
                            <th>DishID</th>
                            <th>DishName</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th>Image</th>
                            <th>Order</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="dish" items="${searchResults}">
                            <tr>
                                <td>${dish.dishId}</td>
                                <td>${dish.dishName}</td>
                                <td>${dish.price}</td>
                                <td>${dish.status}</td>
                                <td><img src="${dish.image}" alt="Hình ảnh" width="100"></td>
                                <td>
                                   <button class="btn btn-primary" onclick="addToOrder('${name}', ${price})">Order</button>
                                </td> <!-- Nút Order -->
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
                
    </body>
</html>
