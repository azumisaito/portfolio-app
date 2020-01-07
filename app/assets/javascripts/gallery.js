$(document).ready(function(){
  $(window).on('load',function(){

    var $container = $('#works');
    $container.imagesLoaded( function() {
      $container.masonry({ //mansonryの対象を#worksにする
        itemSelector: '.works__img',
        columnWidth: '.img-fluid',
        gutter: 0
      });  
    });
  });

});
