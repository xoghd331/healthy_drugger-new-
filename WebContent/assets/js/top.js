$(function() {
	//보이기, 숨기기
    $(window).scroll(function() {
        if ($(this).scrollTop() > 1000) { //1000넘으면 버튼 보임
            $('#toTop').fadeIn();            
            $('#toTop').css('left', $('#sidebar').offset().left); // #sidebar left:0 좌표
        } else {
            $('#toTop').fadeOut();
        }
    });
    
    // 버튼 클릭시
    $("#toTop").click(function() {
        $('html, body').animate({
            scrollTop : 0  // 0 까지 animation 이동합니다.
        }, 400);     // 속도 400
        return false;
    });
});