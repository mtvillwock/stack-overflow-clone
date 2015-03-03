
$(document).ready(function(){
  // $('.new_question').on('submit', postMarkdownText);

  $('.new_question').on('keyup', ".question-title", grabTitle);
  $('.new_question').on('keyup', ".question-description", grabDescription);
});

function grabTitle() {
  var title = $('.question-title').val()
}

function grabDescription() {
  console.log("description storage");
}

function convertText(text) {
  debugger;
  var convertedText = "<em>" + text + "</em>";
  return convertedText;
}

function postMarkdownText() {
  console.log("submit");
  // add converted text to DOM
}




// function modelWidget() {

// }

// function viewWidget() {

// }

// function controllerWidget(model, view) {
//   this.model = model;
//   this.view = view;
// }

