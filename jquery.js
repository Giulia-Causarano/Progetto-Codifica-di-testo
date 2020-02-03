$(document).ready(function (){
    $("#contenitore1").hide();
    $("#contenitore2").hide();
    
    
    $(".img1").click(visualizzacontenitore1);
    $(".img2").click(visualizzacontenitore2);
    $(".img1").dblclick(nascondicontenitore1);
    $(".img2").dblclick(nascondicontenitore2);
       
    $("a").on('click', function(event) {
      if (this.hash !== "") {
      event.preventDefault();
      var hash = this.hash;
    $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
         window.location.hash = hash;
      });
    } 
  });
  
});

function visualizzacontenitore1(){
    $("#contenitore1").show();
    $("#contenitore2").hide();
}

function visualizzacontenitore2(){
    $("#contenitore2").show();
    $("#contenitore1").hide();
}

function nascondicontenitore1(){
    $("#contenitore1").hide();
}

function nascondicontenitore2(){
    $("#contenitore2").hide();
}

function punt(area){
    $(area).css("visibility","visible");
}
function puntatore(area){
    $(area).css("visibility","hidden");
}
