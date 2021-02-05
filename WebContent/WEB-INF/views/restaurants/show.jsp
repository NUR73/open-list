<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${restaurant != null}">
                <h2>店舗　詳細ページ</h2>
                <c:if test="${flush != null}">
                    <div id="flush_success">
                        <c:out value="${flush}"></c:out>
                    </div>
                </c:if>
                <table>
                    <tbody>
                        <tr>
                            <th>名</th>
                            <td><c:out value="${restaurant.name}" /></td>
                        </tr>
                        <tr>
                            <th>営業時間</th>
                            <td>
                                <pre><c:out value="${restaurant.ours}" /></pre>
                            </td>
                        </tr>
                        <tr>
                            <th>登録日時</th>
                            <td>
                                <fmt:formatDate value="${restaurant.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td>
                                <fmt:formatDate value="${restaurant.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>

                <form method="POST" action="<c:url value='/usersrestaurants/create?id=${restaurant.id}' />">
                    <button type="submit">お気に入り</button>
                </form>

                <c:if test="${sessionScope.login_user.id == restaurant.user.id}">
                    <p><a href="<c:url value="/restaurants/edit?id=${restaurant.id}" />">この店舗を編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value="/restaurants/index" />">一覧に戻る</a></p>
    </c:param>
</c:import>