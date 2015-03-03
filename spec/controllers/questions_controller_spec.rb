require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  let!(:question) { create(:question) }
  it "creates a question with correct params" do
    get :index
    expect(assigns(:questions)).to include(question)
  end

  it "doesn't create a question with incorrect title length" do
    get :index
    question = Question.create(title: "not", description: "morethantwentyblahblahblahblahblah", username: "ihasone")
    expect(assigns(:questions)).to_not include(question)
  end

  it "doesn't create a question with incorrect description length" do
    get :index
    question = Question.create(title: "descriptionnotlongenough", description: "nottwenty", username: "supbreh")
    expect(assigns(:questions)).to_not include(question)
  end

  it "doesn't create a question with no username" do
    get :index
    question = Question.create(title: "descriptionnotlongenough", description: "morethantwentyblahblahblahblahblah")
    expect(assigns(:questions)).to_not include(question)
  end

  it "updates a question" do
    attr = { username: "test", title: "Updated", description: "sl;aksjdf;lkasjdflklaskjdf;lakja;sldkfj"}
    put :update, :id => question.id, :question => attr
    question.reload

    expect(question.title).to eql attr[:title]
  end

  it "destroys a question" do
    expect {
      delete :destroy, :id => question.id
      }.to change(Question, :count).by(-1)
  end

end
