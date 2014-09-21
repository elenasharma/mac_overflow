class QuestionsController < ApplicationController
  before_filter :get_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.order(created_at: :desc)
  end

  def new
    @question = current_user.questions.new
  end

  def create
    current_user.questions.create(question_params)
    redirect_to '/'
  end

  def show
    ### Show by descending number of votes ###
    @answers = @question.answers.order(votecount: :desc)
    @answer = Answer.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def get_question
    @question = Question.find(params[:id])
  end

end
