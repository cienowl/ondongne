$(document).ready(function(){
    $('li').hover(function(){
        $(this).css("background-color", "#f1f1f1");
        $(this).css("transition", "0.7s")
    }, function(){
        $(this).css("background-color", "white");
        $(this).css("transition", "0.7s")
    })
});