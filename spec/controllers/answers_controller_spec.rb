require 'rails_helper'

RSpec.describe AnswersController, :type => :controller do

  let!(:question) { create(:question) }
  let!(:answer) { create(:answer) }

  it "creates an answer with correct params" do
    expect {
      post :create, question_id: question, answer: { username: answer.username, body: answer.body }
    }.to change{
      question.answers.count
    }.by(1)
  end

  it "doesn't create an answer with nobody. so lonely" do
    answer = {username: "Skeeeltor"}
    expect {
      post :create, question_id: question, answer: answer
    }.to_not change{
      question.answers.count
    }
  end

  it "doesn't create an answer with no username" do
    answer = {body: "Hey there, you mighty lookin fin."}
    expect {
      post :create, question_id: question, answer: answer
    }.to_not change{
      question.answers.count
    }
  end

  it "updates an answer" do
    attributes = { username: "I will update you", body: "Updated"}
    answer.question = create(:question)
    answer.save
    expect {
      put :update, question_id: answer.question, id: answer.id, answer: attributes
    }.to change {
      answer.reload.body
    }
  end

  it "destroys a answer" do
    expect {
      delete :destroy, question_id: question,  :id => answer.id
      }.to change(Answer, :count).by(-1)
  end

end

