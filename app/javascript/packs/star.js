$(document).ready(function() {
    $('.star').click(function(){
        $('.star').css('color', 'grey').css("font-size","50px");
        $(this).css('color', 'white').css('font-size', '60px');
    });
});
$(document).ready(function(){
    $(".star").hover(  //
        function(){
            $(this).animate( { fontSize:"3.5em" } , 300 );},
        function(){
            $(".star").animate( { fontSize:"3em" } , 200 );}
    );
});