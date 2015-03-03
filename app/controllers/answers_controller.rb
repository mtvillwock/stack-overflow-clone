class AnswersController < ApplicationController
  # respond_to :js
  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    puts @answer.inspect
    render partial: 'answers/answer', locals: { answer: @answer }
    # redirect_to question_path(@question)
  end

  def edit
    @answer = Answer.find(params[:id])
    p params[:id]
    @question = Question.find(@answer.question_id)
  end

  def update
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id)
    if @answer.update(answer_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    render nothing: true
    # redirect_to question_path(@answer.question)
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.update(vote: @answer.vote+=1)
    render :json => @answer
    # redirect_to question_path(@answer.question)
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.update(vote: @answer.vote-=1)
    render :json => @answer
    # redirect_to question_path(@answer.question)
  end


  private
  def answer_params
    params.require(:answer).permit(:username, :body, :vote)
  end
end
