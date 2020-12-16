<%--
  Created by IntelliJ IDEA.
  User: JustinPot
  Date: 2020/12/16
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<rapid:override name="title">我的评价</rapid:override>

<rapid:override name="css">
    <link href="../css/comments.css" rel="stylesheet"/>
    <link href="../css/pagination.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://formden.com/static/assets/demos/bootstrap-iso/bootstrap-iso/bootstrap-iso.css" />
</rapid:override>

<rapid:override name="js">
    <script type="text/javascript">
        function gotoDetail(id) {
            let detail = document.getElementById("detail_id");
            detail.value = id;
            let detail_btn = document.getElementById("detail_btn");
            detail_btn.click();
        }
    </script>
</rapid:override>

<rapid:override name="content">

    <div class="comments">
        <div class="title" style="text-align: center;"><h1>我的消息</h1></div>

    <c:forEach items="${thisPageMessages}" var="message">
        <div class="comment-wrap">
            <div class="comment-block" style="word-wrap: break-word;word-break: break-all;overflow: hidden;">
                <h3>评论 <a id="course_name" onclick="gotoDetail(${ message.toComment.blog.id })" >
                    ${ message.toComment.blog.header }</a></h3>
                <h4><a id="user_name">${ message.toComment.user.name }:</a></h4>
                <p class="comment-text">${ message.toComment.text }</p>
                <div class="bottom-comment">
                    <div class="comment-date">${ message.toComment.date }</div>
                </div>
                <div class="comment-wrap">
                    <div class="comment-block">
                        <h4><a id="user_name_in">${ message.user.name }:</a></h4>
                        <p class="comment-text">回复@${ message.toComment.user.name }:
                            ${ message.text }</p>
                        <div class="bottom-comment">
                            <div class="comment-date">${ message.date }</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

        <div class="bootstrap-iso">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6" style="line-height: 30px;">
                        当前第
                        <span class="badge">${pageInfo.pageNum}</span>
                        页，共有
                        <span class="badge">${pageInfo.pages}</span>
                        页，总记录数
                        <span class="badge">${pageInfo.total}</span>条。
                    </div>

                    <div class="col-md-6">
                        <nav aria-label="Page navigation" class="pull-right">
                            <ul class="pagination" style="margin: 0px;">
                                <c:if test="${pageInfo.pages == 0}">
                                    <li class="disabled">
                                        <a href="">
                                            <span aria-hidden="true">首</span>
                                        </a>
                                    </li>
                                    <li class="disabled">
                                        <a href="" aria-label="Previous" class="prePage">
                                            <span aria-hidden="true">上一页</span>
                                        </a>
                                    </li>
                                    <li class="disabled" class="nextPage">
                                        <a href="" aria-label="Next">
                                            <span aria-hidden="true">下一页</span>
                                        </a>
                                    </li>
                                    <li class="disabled">
                                        <a href="">
                                            <span aria-hidden="true">尾</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${pageInfo.pages != 0}">
                                    <li><a  href="${pageContext.request.contextPath}/messages?pageNo=1">首</a>
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
                                            <a href="${pageContext.request.contextPath}/messages?pageNo=${pageInfo.prePage}" aria-label="Previous" class="prePage">
                                                <span aria-hidden="true">上一页</span>
                                            </a>
                                        </li>
                                    </c:if>

                                    <c:forEach items="${pageInfo.navigatepageNums}" step="1" var="itemPage">
                                        <c:if test="${pageInfo.pageNum == itemPage}">
                                            <li class="active">
                                                <a href="${pageContext.request.contextPath}/messages?pageNo=${itemPage}">${itemPage}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${pageInfo.pageNum != itemPage}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/messages?pageNo=${itemPage}">${itemPage}</a>
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
                                            <a href="${pageContext.request.contextPath}/messages?pageNo=${pageInfo.nextPage}" aria-label="Next" class="nextPage">
                                                <span aria-hidden="true">下一页</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <li><a
                                            href="${pageContext.request.contextPath}/messages?pageNo=${pageInfo.pages}">尾</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <form action="/detail/" method="get">
            <input type="text" id="detail_id" name="detail_id" hidden>
            <button type="submit" id="detail_btn" hidden></button>
        </form>

    </div>

</rapid:override>

<%@ include file="base.jsp"%>
