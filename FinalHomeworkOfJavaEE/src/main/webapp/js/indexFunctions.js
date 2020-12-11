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
    changeID: function(thisElement) {
        let submit_type = document.getElementById("hidden_id");
        submit_type.value = thisElement.value;
    },

    changeTeacher: function(thisElement) {
        let submit_teacher = document.getElementById("hidden_teacher");
        submit_teacher.value = thisElement.value;
    },

    clickAllBtn: function() {
        let type_btn = document.getElementById('hidden_btn');
        let name_btn = document.getElementById('name_btn');
        let teacher_btn = document.getElementById('teacher_btn');
        let id_btn = document.getElementById('id_btn');
        type_btn.click();
        type_btn.onsubmit(function(){teacher_btn.click()});
        teacher_btn.onsubmit(function(){name_btn.click()});
        name_btn.onsubmit(function(){id_btn.click()});
    },

    submitAll: function() {
            document.getElementById('hidden_btn').click();
    },

};











