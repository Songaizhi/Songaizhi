$(function () {
    $(".system_log dl dt dd").hide();
    $(".system_log dt").click(function () {
        $(this).children("dl").slideToggle(300);
    });
});