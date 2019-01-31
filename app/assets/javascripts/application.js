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

  // ヘッダーのドロップダウンリスト
  $(function(){
      $('.header-nav li').hover(function(){
          $("ul:not(:animated)", this).slideDown();
      }, function(){
          $("ul.sub",this).slideUp();
      });
  });

  // イラスト詳細画面のイラストをオリジナルサイズで表示
  $(function() {
    $('.illust-open').click(function() { // イラストをクリック
      $('body').append('<div class="modal-overlay"></div>'); // モーダル表示用タグ追加
      $('modal-overlay').fadeIn('slow'); // モーダルダイアログをフェードイン
      var modal = '#' + $(this).attr('data-target'); // クリックしたタグのdata-target属性を取得
      modalResize(); // モーダルダイアログの表示位置設定
      $(modal).fadeIn('slow'); // モーダルダイアログのコンテンツをフェードイン

      $('.orig-illust, .orig-correction').off().click(function() { // modal-overlayクラスの要素をクリック
        $(modal).fadeOut('slow');
        $('.modal-overlay').fadeOut('slow', function() { // モーダルダイアログをフェードアウト
        $('modal-overlay').remove(); // モーダルダイアログを削除
        });
      });

      $(window).on('resize', function() { // windowをリサイズした場合、モーダル位置設定を再度行う
        modalResize();
      });

      function modalResize() {
        // windowの幅・高さを取得
        var w = $(window).width();
        var h = $(window).height();

        // モーダルコンテンツの表示位置を取得
        var x = (w - $(modal).outerWidth(true)) / 2;
        var y = (h - $(modal).outerHeight(true)) / 2;

        // モーダルコンテンツの表示位置を設定
        $(modal).css({'left': x + 'px', 'top': y + 'px'});
      }
    });
  });

  // 添削コメントのidに連番設定(モーダルダイアログ用)
  $(function() {
    $('.modal-content.correction').each(function(i) {
      $(this).attr('id', 'correct_' + (i + 1));
    });
    $('.corrected-illust a').each(function(c) {
      $(this).attr('data-target', 'correct_' + (c + 1));
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
    });
  });

  // 上に戻るボタンの挙動を設定
  $(function() {
    var to_top = $('.to-top');
    to_top.hide(); //上に戻るボタンを非表示
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

  // footerの挙動を設定
  $(function() {
    var footer = $('.footer'); // footerを非表示
    footer.hide();
    $(window).scroll(function () {
      var doch = $(document).innerHeight(); // ページ全体の高さ
      var winh = $(window).innerHeight(); // ウィンドウの高さ
      var bottom = doch - winh; // ＝ページの最下部位置
      if (bottom <= $(window).scrollTop()) {
        footer.fadeIn();
      } else {
        footer.fadeOut();
      }
    });
  });

});
