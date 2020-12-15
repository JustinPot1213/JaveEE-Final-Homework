<%--
  Created by IntelliJ IDEA.
  User: JustinPot
  Date: 2020/12/15
  Time: 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">${blog.name}</rapid:override>

<rapid:override name="css">
    <link href="../css/detail.css" rel="stylesheet"/>
</rapid:override>

<rapid:override name="js"></rapid:override>

<rapid:override name="content">



    <div class="col-md-6">
        <nav aria-label="Page navigation" class="pull-right">
            <ul class="pagination" style="margin: 0px;">
                <li><a href="${pageContext.request.contextPath}/index?pageNo=1">首页</a>
                </li>
                <c:if test="${pageInfo.pageNum==1}">
                    <li class="disabled">
                        <a href="" aria-label="Previous" class="prePage">
                            <span aria-hidden="true">上一页</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${pageInfo.pageNum!=1}">
                    <li>
                        <a href="${pageContext.request.contextPath}/index?pageNo=${pageInfo.prePage}" aria-label="Previous" class="prePage">
                            <span aria-hidden="true">上一页</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${pageInfo.navigatepageNums}" step="1" var="itemPage">
                    <c:if test="${pageInfo.pageNum == itemPage}">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/index?pageNo=${itemPage}">${itemPage}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum != itemPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/index?pageNo=${itemPage}">${itemPage}</a>
                        </li>
                    </c:if>
                </c:forEach>

                <c:if test="${pageInfo.pageNum == pageInfo.pages}">
                    <li class="disabled" class="nextPage">
                        <a href="" aria-label="Next">
                            <span aria-hidden="true">下一页</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${pageInfo.pageNum != pageInfo.pages}">
                    <li>
                        <a href="${pageContext.request.contextPath}/index?pageNo=${pageInfo.nextPage}" aria-label="Next" class="nextPage">
                            <span aria-hidden="true">下一页</span>
                        </a>
                    </li>
                </c:if>
                <li><a
                        href="${pageContext.request.contextPath}/index?pageNo=${pageInfo.pages}">尾页</a>
                </li>
            </ul>
        </nav>
    </div>
</rapid:override>

<%@ include file="base.jsp"%>
