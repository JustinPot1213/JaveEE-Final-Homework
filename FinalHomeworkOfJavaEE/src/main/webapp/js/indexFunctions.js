const indexJs = {

    changeType: function (thisElement) {
        let type = document.getElementById("course_type");
        let submit_type = document.getElementById("hidden_type");
        type.innerHTML = thisElement.innerHTML;
        submit_type.value = thisElement.innerHTML;
    },

    changeName: function(thisElement) {
        let submit_name = document.getElementById("hidden_name");
        submit_name.value = thisElement.value;
    },
    changeText: function(thisElement) {
        let submit_type = document.getElementById("hidden_text");
        submit_type.value = thisElement.value;
    },

    changeAuthor: function(thisElement) {
        let submit_teacher = document.getElementById("hidden_author");
        submit_teacher.value = thisElement.value;
    },

    clickAllBtn: function() {
        let type_btn = document.getElementById('hidden_btn');
        let name_btn = document.getElementById('name_btn');
        let author_btn = document.getElementById('author_btn');
        let text_btn = document.getElementById('text_btn');
        type_btn.click();
        type_btn.onsubmit(function(){author_btn.click()});
        author_btn.onsubmit(function(){name_btn.click()});
        name_btn.onsubmit(function(){text_btn.click()});
    },

    submitAll: function() {
        document.getElementById('hidden_btn').click();
    },



    gotoPrevPage: function () {
        let thisPage = document.getElementsByClassName("pagination__number pagination__number_active").item(0);
        var pageNum = thisPage.innerHTML;
        if(pageNum != '1') pageNum -=1;
        let prevPage = document.getElementById(pageNum);
    },

    gotoPage: function (thisElement) {
        let thisPage = document.getElementsByClassName("pagination__number pagination__number_active").item(0);
        thisPage.className = "pagination__number";
        thisElement.className = "pagination__number pagination__number_active";
    },

    gotoDetail: function (id) {
        let detail = document.getElementById("detail_id");
        detail.value = id;
        let detail_btn = document.getElementById("detail_btn");
        detail_btn.click();
    },

    star: function (courseid) {
        var str = courseid.toString();
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
    },

};











