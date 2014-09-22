class QuestionsController < ApplicationController
  before_filter :get_question, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    # create filtering/sorting method on your model and pass it the params so that you can have several ways of filtering.
    if params[:order] == "new"
      @questions = Question.order(created_at: :desc)
    else
      @questions = Question.order(votecount: :desc)
    end
  end

  def new
    @question = current_user.questions.new
    # CR - don't need current_user here.
  end

  def create
    # CR - what happens if I can't create it?  Use new / save
    current_user.questions.create(question_params)
    redirect_to '/'
  end

  def show

    @answer = Answer.new
    # CR consider sorting methods on the answers model.
    if params[:order] == "new"
      @answers = @question.answers.order(created_at: :desc)
    else
      @answers = @question.answers.order(votecount: :desc)
    end

  end

  def edit
  end

  def update
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to root_path
  end

  def upvote
    @votes = @question.votes
    @votes.create()
    @question.increment!(:votecount, by = 1)
    render json: @votes.size
  end

  def downvote
    @votes = @question.votes
    @votes.last.destroy
    @question.decrement!(:votecount, by = 1)
    render json: @votes.size
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def get_question
    @question = Question.find(params[:id])
  end

end
