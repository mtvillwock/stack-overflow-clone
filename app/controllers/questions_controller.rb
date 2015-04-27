class QuestionsController < ApplicationController
  include HTTParty
  def index
    @questions = Question.all
    @question = Question.new
    response = HTTParty.get('https://api.github.com/zen',:headers => {
      "Authorization" => 'token ' + ENV["AUTH_TOKEN"], "User-Agent" => "007"})
    if response.headers["x-ratelimit-remaining"].to_i > 1
      @response = response.parsed_response
    else
      @response = "If it hurts to breath, open a window."
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @blank_answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @questions = Question.all
    @question = Question.new(question_params)
    if @question.save
       render partial: 'questions/question'
    else
      render partial: '/questions/form'
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render :nothing => true
  end

  def upvote
    @question = Question.find(params[:id])
    @question.update(vote: (@question.vote + 1))
    render :json => @question
  end

  def downvote
    @question = Question.find(params[:id])
    @question.update(vote: @question.vote-=1)
    render :json => @question
  end

  private
  def question_params
    params.require(:question).permit(:title, :description, :username, :vote)
  end

end
