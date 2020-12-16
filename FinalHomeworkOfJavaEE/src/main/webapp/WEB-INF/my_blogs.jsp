<%--
  Created by IntelliJ IDEA.
  User: JustinPot
  Date: 2020/12/16
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<rapid:override name="title">我的博客</rapid:override>

<rapid:override name="css">
    <link href="../css/table.css" rel="stylesheet"/>
    <link href="../css/searchBar.css" rel="stylesheet">
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/bootstrap-theme.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.css">
</rapid:override>

<rapid:override name="js">
    <script type="text/javascript">
        var successMessage =  ${sessionScope['org.springframework.web.servlet.support.SessionFlashMapManager.FLASH_MAPS'][0]['successMessage']};
        if (successMessage != "") alert(successMessage);
        window.history.replaceState(null, null, window.location.href);
    </script>
    <script type="text/javascript" src="../js/bootstrap-paginator.js"></script>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
    <script type="text/javascript" src="../js/npm.js"></script>
    <script type="text/javascript" src="../js/pageHelper.js"></script>
    <script type="text/javascript" src="../js/indexFunctions.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.js"></script>
    <script type="text/javascript">
        //处理上下页
        $(function () {
            //上一页
            var curPage = ${ pageInfo.pageNum };
            var totalPages = ${ pageInfo.total };

            $(".prePage").click(function () {
                if (curPage > 1) {
                    var pageNo = curPage - 1;
                    $(this).attr("href", "${pageContext.request.contextPath}/index?pageNo=" + pageNo);
                }
            });
            //下一页
            $(".nextPage").click(function () {
                if (curPage < totalPages) {
                    var pageNo = curPage + 1;
                    $(this).attr("href", "${pageContext.request.contextPath}/index?pageNo=" + pageNo);
                }
            });
        })

        function gotoDetail(id) {
            let detail = document.getElementById("detail_id");
            detail.value = id;
            let detail_btn = document.getElementById("detail_btn");
            detail_btn.click();
        }

        function changeName(thisElement) {
            let submit_name = document.getElementById("hidden_name");
            submit_name.value = thisElement.value;
        }
        function changeText(thisElement) {
            let submit_text = document.getElementById("hidden_text");
            submit_text.value = thisElement.value;
        }

        function changeAuthor(thisElement) {
            let submit_author = document.getElementById("hidden_author");
            submit_author.value = thisElement.value;
        }

        function changePage(thisElement) {
            let submit_page = document.getElementById("hidden_page");
            submit_page.value = thisElement.value;
        }

        function clickAllBtn() {
            let type_btn = document.getElementById('hidden_btn');
            let name_btn = document.getElementById('name_btn');
            let author_btn = document.getElementById('author_btn');
            let text_btn = document.getElementById('text_btn');
            type_btn.click();
            type_btn.onsubmit(function(){author_btn.click()});
            author_btn.onsubmit(function(){name_btn.click()});
            name_btn.onsubmit(function(){text_btn.click()});
        }

        function submitAll() {
            document.getElementById('hidden_btn').click();
        }

        function star(blogid) {
            var str = blogid.toString();
            var starId = str.concat("star");
            var staredId = str.concat("stared");
            var star = document.getElementById("star_id");//收藏博客的id
            star.value = courseid;
            var decision = document.getElementById("decision_id");//收藏或者取消收藏
            var star_btn =  document.getElementById("star_btn");
            if(document.getElementById(starId).style.display == "block"){
                document.getElementById(starId).style.display = "none";
                document.getElementById(staredId).style.display = "block";
                decision.value = 'like';
                star_btn.click();
            }
            else{
                document.getElementById(starId).style.display = "block";
                document.getElementById(staredId).style.display = "none";
                decision.value = 'cancel';
                star_btn.click();
            }
            return false;
        }
    </script>
</rapid:override>

<rapid:override name="content">
    <div class="header" id="head" >
        <div class="title" style="text-align: center;"><h1>我的博客</h1></div>
    </div>
    <br>
    <div id="container" style="height: auto">


<%--        <div style="float: left;">--%>
<%--            <form>--%>
<%--                <button style="border-radius: 42px;border: 2px solid #324B4E;background: #F9F0DA; width: 195px;margin-top: 20px;">--%>
<%--                    <a href="/write_blog/">写一篇新的博客</a>--%>
<%--                </button>--%>
<%--            </form>--%>
<%--        </div>--%>


<%--        <div class="search bar7" style="float: right;">--%>
<%--            <form action="/index/" method="get">--%>
<%--                <input type="text" id="blog_name" onchange='changeName(this)' placeholder="请输入您要搜索的博客名">--%>
<%--                <input style='display:none' />--%>
<%--                &emsp;<button type="button" id="name_btn" onclick="submitAll()"></button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--        <div class="search bar7" style="float: right">--%>
<%--            <form action="/index/" method="get">--%>
<%--                <input type="text" id="blog_author" onchange='changeAuthor(this)' placeholder="请输入您要搜索的作者名">--%>
<%--                <input style='display:none' />--%>
<%--                <button type="button" id="author_btn" onclick="submitAll()"></button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--        <div class="search bar7" style="float: right">--%>
<%--            <form action="/index/" method="get">--%>
<%--                <input type="text" id="blog_text" onchange='changeText(this)' placeholder="请输入要搜索的博客内容">--%>
<%--                <input style='display:none' />--%>
<%--                <button type="button" id="text_btn" onclick="submitAll()"></button>--%>
<%--            </form>--%>
<%--        </div>--%>

<%--        <form action="/index/" method="post">--%>
<%--            <input type="text" id="hidden_text" name="blog_text" hidden>--%>
<%--            <input type="text" id="hidden_author" name="blog_author" hidden>--%>
<%--            <input type="text" id="hidden_name" name="blog_name" hidden>--%>
<%--                &lt;%&ndash;            <input type="text" id="hidden_page" name="pageNo" hidden>&ndash;%&gt;--%>
<%--            <button type="submit" id="hidden_btn" hidden></button>--%>
<%--        </form>--%>

        <form action="/detail/" method="get">
            <input type="text" id="detail_id" name="detail_id" hidden>
            <button type="submit" id="detail_btn" hidden></button>
        </form>

        <table class="bordered" style="border: none;">
            <thead>
            <tr>
                <th style="text-align: center; width: 400px;">博客名</th>
                <th style="text-align: center">作者名</th>
                <th style="text-align: center">发博时间</th>
                    <%--                <th style="text-align: center">收藏</th>--%>
            </tr>
            </thead>

            <c:forEach items="${thisPageBlogs}" var="itemBlog">
                <tr>
                    <td onclick="gotoDetail(${itemBlog.id})" style="text-align: center">${itemBlog.header}</td>
                    <td onclick="gotoDetail(${itemBlog.id})" style="text-align: center">${itemBlog.user.name}</td>
                    <td onclick="gotoDetail(${itemBlog.id})" style="text-align: center">${itemBlog.date}</td>
                        <%--                <td>--%>
                        <%--                    <c:set var="flag" value="false" />--%>
                        <%--                    <c:forEach items="${favorites}" var="favorite">--%>
                        <%--                        <c:if test="${favorite.id} == ${itemBlog.id}">--%>
                        <%--                            <c:set var="flag" value="true" />--%>
                        <%--                        </c:if>--%>
                        <%--                    </c:forEach>--%>
                        <%--                <c:if test="${flag == true}">--%>
                        <%--                    <span style=" text-align:center;display:none" onclick="star(${itemBlog.id})"id = "${itemBlog.id}star">--%>
                        <%--                        <i class="fa fa-star-o" aria-hidden="true"></i>--%>
                        <%--                    </span>--%>
                        <%--                    <span  style=" text-align:center;display:block" onclick="star(${itemBlog.id})"id = "${itemBlog.id}stared">--%>
                        <%--                        <i class="fa fa-star" aria-hidden="true"></i>--%>
                        <%--                    </span>--%>
                        <%--                </c:if>--%>
                        <%--                <c:if test="${flag != true}">--%>
                        <%--                    <span style=" text-align:center;display:block" onclick="star(${itemBlog.id})"id = "${itemBlog.id}star">--%>
                        <%--                        <i class="fa fa-star-o" aria-hidden="true"></i>--%>
                        <%--                    </span>--%>
                        <%--                    <span  style=" text-align:center;display:none" onclick="star(${itemBlog.id})"id = "${itemBlog.id}stared">--%>
                        <%--                        <i class="fa fa-star" aria-hidden="true"></i>--%>
                        <%--                    </span>--%>
                        <%--                </c:if>--%>
                        <%--                </td>--%>
                </tr>
            </c:forEach>

        </table>


        <form action="/index/" method="post" target="iframe_id" hidden>
            <input type="text" id = "star_id" name="star_id"/>
            <input type="text" id = "decision_id" name="decision_id"/>
            <button type="submit" id="star_btn"></button>
        </form>

        <iframe id="iframe_id" name="iframe_id" style="display:none;"></iframe>

        <!-- 分页进度条 -->

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
                                        <span aria-hidden="true">首页</span>
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
                                        <span aria-hidden="true">尾页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${pageInfo.pages != 0}">
                                <li><a  href="${pageContext.request.contextPath}/my_blogs?pageNo=1">首页</a>
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
                                        <a href="${pageContext.request.contextPath}/my_blogs?pageNo=${pageInfo.prePage}" aria-label="Previous" class="prePage">
                                            <span aria-hidden="true">上一页</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach items="${pageInfo.navigatepageNums}" step="1" var="itemPage">
                                    <c:if test="${pageInfo.pageNum == itemPage}">
                                        <li class="active">
                                            <a href="${pageContext.request.contextPath}/my_blogs?pageNo=${itemPage}">${itemPage}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${pageInfo.pageNum != itemPage}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/my_blogs?pageNo=${itemPage}">${itemPage}</a>
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
                                        <a href="${pageContext.request.contextPath}/my_blogs?pageNo=${pageInfo.nextPage}" aria-label="Next" class="nextPage">
                                            <span aria-hidden="true">下一页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <li><a
                                        href="${pageContext.request.contextPath}/my_blogs?pageNo=${pageInfo.pages}">尾页</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>



    </div>



</rapid:override>

<%@ include file="base.jsp"%>