$(function(){
    legacySupportIE();
    
    if( lessThanEqualToIE8() ){// lte IE8
        $("body").append("<div id='supportNotice' style='position:absolute;top:0;background:red;z-index:10000000000;padding:10px;right:18px;width:50%;'><a href='http://whatbrowser.org'><b>Please update your browser.</b></a> Some features of this site will not be supported. </div>");
        setTimeout(function(){$("#supportNotice").fadeOut()},10000);
        $("nav .search").remove();
        $("#newsFeed").remove();
    }
    
    if( isIE8() ){// is IE8
        $("nav .openMenu").on('click',function(){
            $(this).toggleClass("openSubMenu");    
        });
    }
    
    $(".openMenu input").change(function () { 
        if( isIE9() ){ //gte IE8
            if($(this).prop('checked') ){
                $("~ul li",this).stop().animate({
                    height: 40
                }, 400 ); 
            }else{
                $("~ul li",this).stop().animate({
                    height: 0
                }, 400 );   
            }
        }
    });
    
    $("#newsFeed").mouseleave(function() {
        menuClose();
        $("body").removeClass("showNewsFeedSearch");
    });
    $('#mainNav input').pressEnter(function(){
        $(".openMenu input").prop('checked',false);
        $(".openMenu input").change();
        if($("body").hasClass("showNewsFeed")){
            menuClose();
        }
    });       

    var sideBarW = $("#sideBar").width();
    var navW = 68;
    $("#mainContainer").css({"-ms-transform":"translateX(0)"});
    $('nav').hover(function() {
        if( isIE9() ){
            $("#mainNavCheck").prop('checked', true);
            $('#mainNav .autoExpand input[type="checkbox"]').prop('checked', true);
            $(".autoExpand ul li").css({height:"0"});
            $(this).prop('checked',true);
            $(".openMenu input",this).change();                
        }
        if($("body").hasClass("showNewsFeed")){
            if( lessThanEqualToIE8() ){
                $('#mainContainer').stop().animate({
                    left: sideBarW - navW
                }, 400 );                    
            }else{
                $("nav").css({width:"65px"});    
                $('nav').stop().animate({
                    width: sideBarW
                }, 400 );
            }                    
        }else{
            $('#mainContainer').stop().animate({
                left: sideBarW - navW
            }, 400 );
        }
    },
    function() {
        if(!$("body").hasClass("showNewsFeedSearch")){
            menuClose();
        }
    });

function menuClose(){
    if( isIE9() ){
        $("#mainNavCheck").prop('checked', false);
        $('#mainNav .autoExpand input[type="checkbox"]').prop('checked', false);
        $(".openMenu input").prop('checked',false);
        $(".openMenu input").change();        
    }
    if($("body").hasClass("showNewsFeed")){
        if( lessThanEqualToIE8() ){
            $('#mainContainer').stop().animate({
                left: 0
            }, 400 );                      
        }else{
            $('nav').stop().animate({
                width: navW
            }, 400 );          
        }            
    }else{
        $('#mainContainer').stop().animate({
            left: 0
        }, 400 );          
    }
}
});



function isIE8(){
    return $("html").hasClass("no-csstransforms") && $("html").hasClass("hashchange");
}

function lessThanEqualToIE8(){
    return $("html").hasClass("no-csstransforms");
}

function greaterThanEqualToIE8(){
    return $("html").hasClass("hashchange");
}    

function isIE9(){
    return $("html").hasClass("csstransforms");
}



function legacySupportIE(){
    $("#wookmark .item").css({"-ms-transform":"scale(1)"});
    
    if( lessThanEqualToIE8() ){ // if lte IE8
        $(".featuredContainer #controls .left, .featuredContainer #controls .right")
            .css({"margin-top":"-45px"});
        var featureH = $(".featuredContainer .contentWrap").height()/2;
        $(".featuredContainer .featureContent .contentWrap")
            .css({"margin-top":-featureH});        
    }
}
