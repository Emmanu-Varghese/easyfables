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
//= require rails-ujs
//= require jquery
//= require jquery-validate/jquery.validate.min.js
//= require jquery-validate/additional-methods.min.js
//= require bootstrap/js/bootstrap.bundle.min.js
//= require javascripts/feather.min.js
//= require activestorage
//= require turbolinks
//= require ckeditor/init
//= require_tree ./channels
//= require_tree .

$(document).on('ready turbolinks:load', function() {
	feather.replace();
	  //load more posts on click of button
    if ($('#paginate-load-more-button').size() > 0) {
      $('#paginate-load-more-button .pagination').hide()

      $('button#load-more-posts').off().on("click", function() {
        more_comments_url = $('#paginate-load-more-button .pagination a.next_page').attr('href');
        $this = $(this);
        $this.html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />').addClass('disabled');
        $.getScript(more_comments_url, function() {
          if ($this) {
            $this.text('Load more comments').removeClass('disabled');
          }
        });
      });
    };

    // $('.like__btn').off().on('click', function(){
    //   // Check if it's already been clicked
    //   if ($(this).hasClass('active')) {
    //     $(this).removeClass('active')
    //     // Update the number
    //     updated_likes = parseInt($('.like__btn span').html()) - 1;
    //     $('.like__btn span').html(updated_likes);
    //   }else{
    //     $(this).addClass('active')
    //     // Update the number
    //     updated_likes = parseInt($('.like__btn span').html()) + 1;
    //     $('.like__btn span').html(updated_likes);
    //   }
    // });
  });

function bind_textareas() {
  $('textarea.track-chars').each(function() {
        //console.log(  $('textarea').siblings('.chars'))

        if ( $(this).attr('chars') != 1 ) {
          var maxLength = parseInt($(this).attr('maxLength'));
          $(this).attr('chars', 1);
          $(this).parent().append('<span class="chars">' + $(this).text().length + '</span><span> / ' + maxLength + ' characters</span>');
          var count = $(this).val().length;   

          if(count == maxLength) {
            $(this).next('.chars').css('color', 'red');
          } else if (count >= parseInt(maxLength / 2)) {
            $(this).next('.chars').css('color', 'orange');        
          } else {
            $(this).next('.chars').css('color', 'green');
          }  
        }     
      });


  $('textarea.track-chars').on('input', function (){    
    var maxLength = parseInt($(this).attr('maxLength'));
    var count = $(this).val().length;
    var charLeft =  maxLength - count;

    if(count == maxLength) {
      $(this).next('.chars').css('color', 'red');
    } else if (count >= parseInt(maxLength / 2)) {
      $(this).next('.chars').css('color', 'orange');
    } else {
      $(this).next('.chars').css('color', 'green');
    }
    $(this).next('.chars').text(count);
  }); 


  $('trix-editor.track-chars').each(function() {
        //console.log(  $('textarea').siblings('.chars'))

        if ( $(this).attr('chars') != 1 ) {
          var maxLength = parseInt($(this).attr('maxLength'));
          $(this).attr('chars', 1);
          $(this).parent().append('<span class="chars">' + $(this).text().length + '</span><span> / ' + maxLength + ' characters</span>');
          var count = $(this).val().length;   

          if(count == maxLength) {
            $(this).next('.chars').css('color', 'red');
          } else if (count >= parseInt(maxLength / 2)) {
            $(this).next('.chars').css('color', 'orange');        
          } else {
            $(this).next('.chars').css('color', 'green');
          }  
        }     
      });


  $('trix-editor.track-chars').on('input', function (){    
    var maxLength = parseInt($(this).attr('maxLength'));
    var count = $(this).val().length;
    var charLeft =  maxLength - count;

    if(count == maxLength) {
      $(this).next('.chars').css('color', 'red');
    } else if (count >= parseInt(maxLength / 2)) {
      $(this).next('.chars').css('color', 'orange');
    } else {
      $(this).next('.chars').css('color', 'green');
    }
    $(this).next('.chars').text(count);
  }); 
}
