$(document).ready(function(){
    var $panel = $("#recommend").find("ul");
    var itemWidth = $panel.children().outerWidth();
    var itemLength = $panel.children().length;
    //Auto 롤링아이디
    var rollingId;
    //auto();
    
    $panel.mouseout(function() {
    //	auto();
    });
    $("#prev").on("click",prev);
    $("#prev").mouseover(function(e) {
        clearInterval(rollingId);
        //반복하는 것을 멈추게 하는 메서드
    });
    $("#prev").mouseout(auto);

    $("#next").on("click", next);

    $("#next").mouseover(function(e) {
        clearInterval(rollingId);
    });
    $("#next").mouseout(auto);
    function auto() {

            // 2초마다 start 호출
            rollingId = setInterval(function() {
                start();
            }, 5000);
        }

        function start() {
            $panel.css("width", itemWidth * itemLength);
            $panel.animate({"left": - itemWidth + "px"}, function() {

                // 첫번째 아이템을 마지막에 추가하기
                $(this).append("<li>" + $(this).find("li:first").html() + "</li>");

                // 첫번째 아이템을 삭제하기
                $(this).find("li:first").remove();

                // 좌측 패널 수치 초기화
                $(this).css("left", 0);
            });
        }

        // 이전 이벤트 실행
        function prev(e) {
            $panel.css("left", - itemWidth);
            $panel.prepend("<li>" + $panel.find("li:last").html() + "</li>");
            $panel.animate({"left": "0px"}, function() {
                $(this).find("li:last").remove();
            });
        }

        // 다음 이벤트 실행
        function next(e) {
            $panel.animate({"left": - itemWidth + "px"}, function() {
                $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
                $(this).find("li:first").remove();
                $(this).css("left", 0);
            });
        }

        $('.icon').click(function(){
          alert(1111);
        });

});
