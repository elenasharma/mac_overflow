class AnswersController < ApplicationController
  before_filter :get_question, only: [:create, :update]
  # you have two workflows annonymous and logged in - this should be two separate controllers. This keeps logic out of the view and allows you to have a lot more flexibility.

  rescue Exception => e

  end

  def create
    @answer = @question.answers.create(answer_params)
    if current_user #don't set foreign or primary keys directly instead use the AR association - current_user.answers <<
      @answer.update_attributes(user_id: current_user.id)
    end
    redirect_to question_path(@question)
  end

  def update
  end

  def destroy
    Answer.find(params[:id]).destroy
    # Don't put this logic in your view - try to keep logic out of the view
    redirect_to user_path(current_user)
  end

  def upvote
    @answer = Answer.find(params[:id])
    # make this a model method - upvote(@answer) or perhaps a module that is mixed in to both answer and question.
    @votes = @answer.votes
    @votes.create()
    @answer.increment!(:votecount, by = 1)
    render json: @votes.size
  end

  def downvote
    @answer = Answer.find(params[:id])
    @votes = @answer.votes
    @votes.last.destroy
    @answer.decrement!(:votecount, by = 1)
    render json: @votes.size
  end


  private

  def get_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end

end
