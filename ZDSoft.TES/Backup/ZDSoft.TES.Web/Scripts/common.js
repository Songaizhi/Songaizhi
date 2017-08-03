// JavaScript Document
$("#login_content_log").on('click', function () {
    $("#login_content_log,#login_content_reg").fadeOut();
    $("#login_content_log_02").fadeIn();
});
$("#login_close").on('click', function () {
    $("#login_content_log,#login_content_reg").fadeIn();
    $("#login_content_log_02").fadeOut();
});
$("#login_input11").on('focus', function () {
    $(this).css('color', 'black');
    if ($(this).val() == "用户名") {
        $(this).val('');
    }
    $("#login_input1").css('borderColor', '#0099cc').css('box-shadow', '#0099cc 0px 0px 3px');
}).on('blur', function () {
    $(this).css('color', 'gray');
    if ($(this).val() == '') {
        $(this).val('用户名');
    }
    $("#login_input1").css('borderColor', 'gray').css('box-shadow', 'none');
});
$("#login_input12").on('focus', function () {
    $(this).css('color', 'black');
    //document.getElementById("login_input12").type = 'password';
    $("#login_input12[type='text']").attr('type', 'password');
    if ($(this).val() == "密码") {
        $(this).val('');
    }
    $("#login_input2").css('borderColor', '#0099cc').css('box-shadow', '#0099cc 0px 0px 3px');
}).on('blur', function () {
    $(this).css('color', 'gray');
    //document.getElementById("login_input12").type = 'text';
    $("#login_input12[type='password']").attr('type', 'text');
    if ($(this).val() == '') {
        $(this).val('密码');
    }
    $("#login_input2").css('borderColor', 'gray').css('box-shadow', 'none');
    if ($(this).val() != '' && $(this).val() != "密码") {
        //document.getElementById("login_input12").type = 'password';
        $("#login_input12[type='text']").attr('type', 'password');
    }
});


$("#login_input4 input").on('click', function () {
    var account = $("#Account").val();
    var password = $("#PassWord").val();
    if (account == "") {
        $("#login_tip").text("用户名不能为空");
        return;
    }
    else if (password == "") {
        $("#login_tip").text("密码不能为空");
        return;
    }
    $("form:eq(0)").submit();
});


function getCookie(name)//cookie检查
{
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}