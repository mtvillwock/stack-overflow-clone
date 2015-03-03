
$(document).ready(function(){

    $('.new_question').on("submit", addQuestion);
    $('.question-list').on('click', '.upvote', upVoteQuestion);
    $('.question-list').on('click', '.downvote', downVoteQuestion);
    $('.question-list').on('click', '.delete-question', deleteQuestion);
})


function addQuestion(e) {
  e.preventDefault();
  var $target = $(e.currentTarget);
  var url = e.currentTarget.action;

  $.ajax({
    url: url,
    type: 'POST',
    data: $target.serialize()
    // dataType: 'json'
  }).done(function(response) {
    // var newQuestion = buildQuestion(template, response);
    debugger;
   $('.question-list').append(convertText(response));
   $('#question_username').val("");
   $('#question_title').val("");
   $('#question_description').val("");
  })
}


function deleteQuestion(e) {
  e.preventDefault();
  var $target = $(e.currentTarget);
  var url = $target.attr('href')
  var question = $target.closest('.question')

  $.ajax({
    url: url,
    type: 'delete'
  }).done(function() {
    question.remove();
  })
}


function upVoteQuestion(e) {
  e.preventDefault();
  var url = $(this).children('a').attr('href');
  var votes = $(e.target).closest('.question').find('.vote');

  $.ajax({
    url: url,
    type: 'PUT'
  }).done(function(response){
    votes.html(response.vote);
  })
}


function downVoteQuestion(e) {
  e.preventDefault();
  var url = $(this).children('a').attr('href');
  var votes = $(e.target).closest('.question').find('.vote');

  $.ajax({
    url: url,
    type: 'PUT'
  }).done(function(response){
    votes.html(response.vote);
  })
}





