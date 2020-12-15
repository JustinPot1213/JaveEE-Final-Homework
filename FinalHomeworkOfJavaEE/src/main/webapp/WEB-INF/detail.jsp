<%--
  Created by IntelliJ IDEA.
  User: JustinPot
  Date: 2020/12/15
  Time: 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<rapid:override name="title">${thisBlog.header}详情页</rapid:override>

<rapid:override name="css">
    <link rel="stylesheet" href="https://formden.com/static/assets/demos/bootstrap-iso/bootstrap-iso/bootstrap-iso.css" />
    <link href="../css/detail.css" rel="stylesheet"/>
</rapid:override>

<rapid:override name="js">
    <script type="text/javascript">

        window.history.replaceState(null, null, window.location.href);

        function clearText(field) {
            if (field.defaultValue == field.value) field.value = '';
            else if (field.value == '') field.value = field.defaultValue;
        }

        function showReplyCommentArea(this_element,comment_id) {
            let commentLabel = document.getElementById("comment_label")
            var this_HTML = this_element.innerHTML
            commentLabel.innerText = "回复@"+ this_HTML.slice(27,-4) +":"
            let toCommentID = document.getElementById("to_comment_id")
            toCommentID.value = comment_id
        }

        function checkReplyOrNot() {
            let toComment = document.getElementById("to_comment_id")
            let commentLabel = document.getElementById("comment_label")
            if(commentLabel.innerText ==="评论") toComment.value = "*"   /* *表示不是回复 */
        }
    </script>
</rapid:override>

<rapid:override name="content">
    <div id="templatemo_site_title_bar_wrapper">
        <div id="templatemo_site_title_bar">
            <div id="site_title" style="width: auto">
                <h1><a>${thisBlog.header}
                    <span style="text-align: left">包含博客内容和相关评价</span>
                </a></h1>
            </div>
        </div>
    </div>

    <div id="templatemo_menu_wrapper">
        <div id="templatemo_menu">
            <ul>
                <li><a href="" class="current fast"><span></span>当前页</a></li>
                <li><a href="/index/"><span></span>博客列表</a></li>
            </ul>
        </div>
    </div>

    <div id="templatemo_content_wrapper_outer">

        <div id="templatemo_content_wrapper_inner">

            <div id="templatemo_content_wrapper">

                <div id="templatemo_content">
                    <div class="content_bottom"></div>

                    <div id="main_column">

                        <div class="post_box" >

                            <h2><a>${thisBlog.header}</a></h2>

                            <div class="post_info">

                                <div class="post_date">
                                    博客编号:<br>${thisBlog.id}<br>&emsp;
                                </div>

                                <div class="post_author">
                                    博客作者:<br>${thisBlog.user.name}<br>&emsp;
                                </div>

                                <div class="post_comment">
                                    书写时间:<br>${thisBlog.date}
                                </div>

                            </div><br>
                            <div class="post_body"
                                 style="word-wrap: break-word;word-break: break-all;overflow: hidden; font-size: larger; margin-bottom: -90px" >
                                &emsp;&emsp;${thisBlog.text}
                            </div>
                            <form action="/detail/" method="post">
                                <div class="group">
                                    <textarea rows="5" required aria-label="评论" name="commentText"></textarea>
                                    <input type="text" style="display: none" id="to_comment_id" aria-label="被回复评论" name="toCommentId">
                                    <span class="highlight"></span><span class="bar"></span>
                                    <label id="comment_label">评论</label>
                                </div>

                                <div class="btn-box">
                                    <button type="submit" class="btn btn-submit" onclick="checkReplyOrNot()">提交</button>
                                </div>
                            </form>

                        </div> <!-- end of a post -->


                    </div> <!-- end of main column -->

                    <div id="side_column">

                        <div class="side_column_section" >

                            <h3>评论区</h3>

                            <c:forEach items="${thisPageComments}" var="comment">
                            <div class="recent_post">
                                <h4><a id="user_name">${ comment.user.name }:</a></h4>
                                <c:if test="${comment.toComment == null}">
                                <div style="word-wrap: break-word;word-break: break-all;overflow: hidden;">${ comment.text }</div>
                                </c:if>
                                <c:if test="${comment.toComment != null}">
                                <div style="word-wrap: break-word;word-break: break-all;overflow: hidden;">回复@ ${ comment.toComment.user.name} :
                                    ${ comment.text }</div>
                                </c:if>
                                <div style="float:left;">
                                    <a style="color: #d43f3a" onclick="showReplyCommentArea(this, ${ comment.id })">回复<p style="display:none;">${ comment.user.name }</p></a></div>
                                <div style="float:right;">${ comment.date}</div>
                                <div style="text-align: center">&nbsp</div>

                            </div>
                            </c:forEach>

                        </div>
                        <div class="bootstrap-iso" style="size: A5">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <nav aria-label="Page navigation" class = "text-center">
                                            <ul class="pagination" style="margin: 0px;">
                                                <c:if test="${pageInfo.pages == 0}">
                                                    <li class="disabled">
                                                        <a href="">
                                                            <span aria-hidden="true">首</span>
                                                        </a>
                                                    </li>
                                                    <li class="disabled">
                                                        <a href="" aria-label="Previous" class="prePage">
                                                            <span aria-hidden="true">前</span>
                                                        </a>
                                                    </li>
                                                    <li class="disabled" class="nextPage">
                                                        <a href="" aria-label="Next">
                                                            <span aria-hidden="true">后</span>
                                                        </a>
                                                    </li>
                                                    <li class="disabled">
                                                        <a href="">
                                                            <span aria-hidden="true">尾</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${pageInfo.pages != 0}">
                                                    <li><a  href="${pageContext.request.contextPath}/detail?pageNo=1">首</a>
                                                    </li>
                                                    <c:if test="${pageInfo.pageNum==1}">
                                                        <li class="disabled">
                                                            <a href="" aria-label="Previous" class="prePage">
                                                                <span aria-hidden="true">前</span>
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${pageInfo.pageNum!=1}">
                                                        <li>
                                                            <a href="${pageContext.request.contextPath}/detail?pageNo=${pageInfo.prePage}" aria-label="Previous" class="prePage">
                                                                <span aria-hidden="true">前</span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                    <c:forEach items="${pageInfo.navigatepageNums}" step="1" var="itemPage">
                                                        <c:if test="${pageInfo.pageNum == itemPage}">
                                                            <li class="active">
                                                                <a href="${pageContext.request.contextPath}/detail?pageNo=${itemPage}">${itemPage}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${pageInfo.pageNum != itemPage}">
                                                            <li>
                                                                <a href="${pageContext.request.contextPath}/detail?pageNo=${itemPage}">${itemPage}</a>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>

                                                    <c:if test="${pageInfo.pageNum == pageInfo.pages}">
                                                        <li class="disabled" class="nextPage">
                                                            <a href="" aria-label="Next">
                                                                <span aria-hidden="true">后</span>
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${pageInfo.pageNum != pageInfo.pages}">
                                                        <li>
                                                            <a href="${pageContext.request.contextPath}/detail?pageNo=${pageInfo.nextPage}" aria-label="Next" class="nextPage">
                                                                <span aria-hidden="true">后</span>
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                    <li><a
                                                            href="${pageContext.request.contextPath}/detail?pageNo=${pageInfo.pages}">尾</a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                                <div class="row">
                                    <nav class="m-auto">
                                        <div class="col-sm-12" style="line-height: 30px;">
                                            当前第
                                            <span class="badge">${pageInfo.pageNum}</span>
                                            页，共有
                                            <span class="badge">${pageInfo.pages}</span>
                                            页，总共
                                            <span class="badge">${pageInfo.total}</span>条。
                                        </div>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end of side column -->

                    <div class="cleaner"></div>
                </div>

                <div class="cleaner"></div>
            </div>

            <div class="cleaner"></div>
        </div>

    </div>

    <div style="display:none">
        <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'>
        </script>
    </div>

</rapid:override>

<%@ include file="base.jsp"%>
