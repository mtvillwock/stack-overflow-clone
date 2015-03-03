
$(document).ready(function(){

  $('.new_answer').on("submit", addAnswer)
  $('.answer-list').on('click', '.upvote', upVoteAnswer);
  $('.answer-list').on('click', '.downvote', downVoteAnswer);
  $('.answer-list').on('click', '.delete-answer', deleteAnswer);
})

function addAnswer(e) {
  e.preventDefault();
  var $target = $(e.currentTarget);
  var url = e.currentTarget.action;

    $.ajax({
      url: url,
      type: 'POST',
      data: $target.serialize(),
    // dataType: 'json'
  }).done(function(response) {
   $('.answer-list').append(response);
   $('#answer_username').val("");
   $('#answer_body').val("");
 })
}

function deleteAnswer(e) {
  e.preventDefault();
  var $target = $(e.currentTarget);
  var url = $target.attr('href')
  var question = $target.closest('.answer')

  $.ajax({
    url: url,
    type: 'delete'
  }).done(function() {
    question.remove();
  })
}

function upVoteAnswer(e) {
  e.preventDefault();
  var url = $(this).children('a').attr('href');
  var votes = $(e.target).closest('.answer').find('.vote');
  $.ajax({
    url: url,
    type: 'PUT'
  }).done(function(response){
    votes.html(response.vote);
  })
}

function downVoteAnswer(e) {
  e.preventDefault();
  var url = $(this).children('a').attr('href');
  var votes = $(e.target).closest('.answer').find('.vote');
  $.ajax({
    url: url,
    type: 'PUT'
  }).done(function(response){
    votes.html(response.vote);
  })
}
