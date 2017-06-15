//datepicker
$(document).on('turbolinks:load', function(){
  $('#book_published_at').datepicker({ dateFormat: 'yy-mm-dd' });
});


$(document).on('turbolinks:load', function(){
    $('#slide').on('click', function(){
        $('.l-nav-submenu').slideToggle();
    });

    $('.l-nav-user').hover(function(){
        $('.l-nav-submenu').slideToggle();
    },function(){
        $('.l-nav-submenu').slideToggle();
    });

});

//tabcolor
var ary = ['/','/requests/lithen', '/requests/grumbl', '/requests/today'];

$(document).on('turbolinks:load', function(){
    $('.m-navlist > li').hover(function(){
        $(this).addClass('current');
    },function(){
        $(this).removeClass('current');
    });

    var index = window.location.pathname;

    if (ary.indexOf(index) >= 0){
        var count = ary.indexOf(index);
        $('.m-navlist-li').removeClass('current');
        $('.m-navlist > li').eq(count).addClass('current');
    }
});


//リクエスト投稿
$(document).ready(function(){
  $("#js-btn-link").click(function(){
    $('#js-message').toggle('slow');
  })
});



$(document).ready(function(){
// キャンパスの要素を取得する
var canvas = document.getElementById( 'map-canvas' ) ;
var e = document.getElementById('address');
var address = e.getAttribute('data-address');
console.log(address);

var mapOptions = {
  zoom: 15 ,  // ズーム値
   scrollwheel: false
  // center: latlng ,  // 中心座標 [latlng]
};

var map = new google.maps.Map( canvas, mapOptions ) ;

var geocoder = new google.maps.Geocoder();

  geocoder.geocode( {'address': address} , function(results, status) {

    // ジオコーディングが成功した場合
    if (status == google.maps.GeocoderStatus.OK) {

      map.setCenter(results[0].geometry.location);

      var marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location
      });
    } else {
      console.log('Geocode was not successful for the following reason: ' + status);
    }
  });
});
