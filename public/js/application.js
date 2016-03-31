$(document).ready(function() {

// SHOW COMMENT FORM
  $('.question-container').on('click', '.question-comment', function(event){
    event.preventDefault();
    $(this).parent().find('form').show();
  });

  $('.answer-container').on('click', '.answer-comment', function(event){
    event.preventDefault();
    $(this).parent().find('form').show();
  });

// AJAX REQUEST FOR FORM
  // $('.question-container').on('submit', '.question-comment', function(event){
  //   event.preventDefault();
  //   var form = $(event.target)
  //   var answerId = $(this).children().first().attr('id')
  //   $.ajax({
  //     method: 'post',
  //     url: form.attr('action'),
  //     data: form.serialize()
  //   }).done(function(response){
  //     $('div#' + answerId).append(response)
  //     form.hide()
  //   }).fail(function(response){
  //     console.log('Body is blank')
  //   });
  // });

  $('.answer-container').on('submit', '.answer-div', function(event){
    event.preventDefault();
    var form = $(event.target)
    var answerId = $(this).children().first().attr('id')
    $.ajax({
      method: 'post',
      url: form.attr('action'),
      data: form.serialize()
    }).done(function(response){
      $('div#' + answerId).append(response)
      form.hide()
    }).fail(function(response){
      console.log('Body is blank')
    });
  });


});


