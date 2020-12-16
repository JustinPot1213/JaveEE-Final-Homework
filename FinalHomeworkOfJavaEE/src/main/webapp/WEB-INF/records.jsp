<%--
  Created by IntelliJ IDEA.
  User: JustinPot
  Date: 2020/12/17
  Time: 0:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<rapid:override name="title">历史浏览</rapid:override>

<rapid:override name="css">
    <link href="../css/history.css" rel="stylesheet"/>
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

        // function deleteRecord(id, page_num) {
        //     let recordToDelete = document.getElementById("delete_id");
        //     recordToDelete.value = id;
        //     let this_page_num = document.getElementById("page");
        //     this_page_num.value = page_num;
        //     let delete_btn = document.getElementById("delete_btn");
        //     delete_btn.click();
        //     return false;
        // }
        window.history.replaceState(null, null, window.location.href);
    </script>
</rapid:override>

<rapid:override name="content">
    <center>
        <div id="container">
            <div id="tasks">
                <div id="notification"><h1>历史浏览</h1></div>

                <ul id="tasksList">
                    <c:forEach items="${thisPageRecords}" var="record">
                    <li style="text-align: center; width: auto ;">
                        <div style="float: left; font-size: 18px">
                            浏览
                            <a id="course_name"  onclick="gotoDetail(${ record.blog.id })">
                                ${ record.blog.header }</a>
                        </div>
                        <div style="float: right; font-size: 15px">
                            ${ record.date }
                        </div>
                        <br><br>
                    </li>
<%--                    <li style="width: 50px; float: right; background-color: #d43f3a"--%>
<%--                        onclick="deleteRecord(${ record.id }, ${ pageInfo.pageNum })">--%>
<%--                        <div style="font-size: 19px">🗑</div>--%>
<%--                    </li>--%>
                    </c:forEach>
                </ul>

            </div>
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
                                        <li><a  href="${pageContext.request.contextPath}/record?pageNo=1">首</a>
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
                                                <a href="${pageContext.request.contextPath}/record?pageNo=${pageInfo.prePage}" aria-label="Previous" class="prePage">
                                                    <span aria-hidden="true">上一页</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:forEach items="${pageInfo.navigatepageNums}" step="1" var="itemPage">
                                            <c:if test="${pageInfo.pageNum == itemPage}">
                                                <li class="active">
                                                    <a href="${pageContext.request.contextPath}/record?pageNo=${itemPage}">${itemPage}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${pageInfo.pageNum != itemPage}">
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/record?pageNo=${itemPage}">${itemPage}</a>
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
                                                <a href="${pageContext.request.contextPath}/record?pageNo=${pageInfo.nextPage}" aria-label="Next" class="nextPage">
                                                    <span aria-hidden="true">下一页</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <li><a
                                                href="${pageContext.request.contextPath}/record?pageNo=${pageInfo.pages}">尾</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <br>
        </div>

        <form action="/detail/" method="get">
            <input type="text" id="detail_id" name="detail_id" hidden>
            <button type="submit" id="detail_btn" hidden></button>
        </form>

<%--        <form action="/record/" method="post" hidden>--%>
<%--            <input type="text" id="delete_id" name="delete_id">--%>
<%--            <input type="text" id="page" name="page">--%>
<%--            <button type="submit" id="delete_btn"></button>--%>
<%--        </form>--%>

        <iframe id="iframe_id" name="iframe_id" style="display:none;"></iframe>

    </center>
</rapid:override>

<%@ include file="base.jsp"%>