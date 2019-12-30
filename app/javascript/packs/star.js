$(document).ready(function() {
    $('.star').click(function(){
        $('.star').css('color', 'grey').css("font-size","40px");
        $(this).css('color', 'white').css('font-size', '50px');
    });
});
$(document).ready(function(){
    $(".star").hover(  //
        function(){
            $(this).animate( { fontSize:"1.5em" } , 300 );},
        function(){
            $(".star").animate( { fontSize:"1em" } , 200 );}
    );
});