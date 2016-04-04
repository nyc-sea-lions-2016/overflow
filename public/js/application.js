$(document).ready(function() {

// SHOW FORM
  $('.question-container').on('click', '.question-answer', function(event){
    event.preventDefault();
    $(this).next().show()
  })

  $('.question-container').on('click', '.question-comment', function(event){
    event.preventDefault();
    $(this).next().show();
  });

  $('.answer-container').on('click', '.answer-comment', function(event){
    event.preventDefault();
    $(this).parent().find('form').show();
  });

// AJAX REQUEST FOR FORM
  $('.question-container').on('submit', '.question-comment-form', function(event){
    event.preventDefault();
    var form = $(event.target)
    $.ajax({
      method: 'post',
      url: form.attr('action'),
      data: form.serialize()
    }).done(function(response){
      $('.question-body').append(response)
      form.hide()
    }).fail(function(response){
      console.log('Body is blank')
    });
  });

  $('.answer-container').on('submit', '.answer-comment-form', function(event){
    event.preventDefault();
    var form = $(event.target)
    var answersComments = $(this).parent().find('.answers-comments')
    console.log(answersComments);
    $.ajax({
      method: 'post',
      url: form.attr('action'),
      data: form.serialize()
    }).done(function(response){
      answersComments.append(response)
      form.hide()
    }).fail(function(response){
      console.log('Body is blank')
    });
  });

  $('.answer-container').on('submit', '.vote', function(event){
    event.preventDefault();
    var form = $(event.target);
    var voteId = $(this).children().first().attr('id');
    $.ajax({
      method: 'post',
      url: form.attr('action'),
      dataType:"json"
      }).done(function(response){
          var newVoteCount = response.new_vote_count;
        $('.vote_counter').text(newVoteCount)
    }).fail(function(response){
    });
  });

});


