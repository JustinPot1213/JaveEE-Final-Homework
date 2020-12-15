$(function () {
    //上一页
    var curPage = '${ pageInfo.pageNum }';
    var totalPages = '${ pageInfo.total }';

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
