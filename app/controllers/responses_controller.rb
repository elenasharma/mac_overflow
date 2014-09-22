class ResponsesController < ApplicationController
	def new

		@response = Response.new
		@answer = Answer.find(params[:answer_id])

		render partial: "new", locals: {response: @response}
	end

	def create
		p params
		@answer = Answer.find(params[:answer_id])
		@answer.responses << @response = Response.create(response_params)
		if current_user
			@response.update_attributes(user_id: current_user.id)
		end
		# @response.save

		render partial: "show", locals: {response: @response}
		# answer = Answer.find(params[:answer_id])
		# @response = Response.new(response_params)
		# answer.responses << @response
		# if @response.save
		# 	@question = Question.find(answer.question_id)
		# 	redirect_to questions_path
		# end
		# # render nothing: true

	end

	 def destroy
    Response.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

	private
	def response_params
		params.require(:response).permit(:body)
	end
end
