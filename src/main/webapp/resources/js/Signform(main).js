$('.tab a').on('click', function (e) {
    e.preventDefault();
    $(this).parent().addClass('active');
    $(this).parent().siblings().removeClass('active');

    target = $(this).attr('href');
    $('.tab-content > div').not(target).hide();
    $(target).fadeIn(600);

});
var writeUsBtn = document.getElementById('signlogin');
console.log(writeUsBtn);

writeUsBtn.onclick = function () {
    $('#writeusmodal').modal();
}

var writeUsBtn = document.getElementById('writeus');

writeUsBtn.onclick = function () {
    $('#ContactUs').modal();
}

$(document).ready(function () {
    $('#passwordconfirm').change(function () {
        var pass = $("#password").val();
        var pass_rep = $("#passwordconfirm").val();

        if (pass != pass_rep) {
            $("#passwordconfirm").css('border', 'red 1px solid');
            $('#password-notmatch ').modal();
        }
    });
});
