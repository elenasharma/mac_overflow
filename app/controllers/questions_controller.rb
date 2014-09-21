class QuestionsController < ApplicationController
  before_filter :get_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def create
  end

  def show
    ### Show by descending number of votes ###
    @answers = @question.answers.order(votecount: :desc)
    @answer = Answer.new
  end

  def update
  end

  def destroy
  end

  private

  def get_question
    @question = Question.find(params[:id])
  end

end
