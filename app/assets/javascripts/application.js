// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//ヘッダーのドロップダウンリスト
// $(function(){
//     $('.menu li').hover(function(){
//         $("ul:not(:animated)", this).slideDown();
//     }, function(){
//         $("ul.sub",this).slideUp();
//     });
// });

// turbolinksによりページ遷移時にjavascriptが動作しなくなるのを回避
document.addEventListener("turbolinks:load", function(){
  // マイページのタブメニュー
  $(function() {
    // 要素(タブ)クリック時に処理させる
    $('.tab-menu li').click(function() {
      // クリックされた要素の順番を取得
      var index = $('.tab-menu li').index(this);
      // 以前に選択していた要素のactiveクラスを削除
      $('.tab-menu li').removeClass('active');
      // 新しくクリックした要素へactiveクラスを追加
      $(this).addClass('active');
      // 以前に選択していた要素を非表示・新しくクリックした要素のコンテンツを表示
      $('.tab-menu-contents section').removeClass('tab-menu-show').eq(index).addClass('tab-menu-show');
    });
  });

  // お気に入り機能 Ajaxによる非同期通信(ページ全体ではなくお気に入り機能だけ更新させる)
  $(function() {
    $(document).on("ajax:success", ".like", function(e) {
      if ($('#' + e.detail[0]).hasClass('fa-heart')){
        $('#' + e.detail[0]).removeClass('fa-heart').addClass('fa-heart-o');
      } else {
        $('#' + e.detail[0]).removeClass('fa-heart-o').addClass('fa-heart');
      }
    })
  })

  // 上に戻るボタンの挙動を設定
  $(function() {
    var to_top = $('.to-top');
    to_top.hide();
    $(window).scroll(function () {
      if ($(this).scrollTop() > 50) { // 50pxスクロールで表示
        to_top.fadeIn();
      } else {
        to_top.fadeOut();
      }
    });
    to_top.click(function() {
      $('body, html').animate({
        scrollTop: 0
      }, 300); // 0.3秒でトップへ戻る
      return false;
    });
  });

});
