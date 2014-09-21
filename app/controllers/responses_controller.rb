class ResponsesController < ApplicationController
	def new
		p params
		p "you made it new!"
		@response = Response.new
		@answer = Answer.find(params[:answer_id])

		render partial: "new", locals: {response: @response}
	end

	def create
		answer = Answer.find(params[:answer_id])
		@response = Response.new(response_params)
		answer.responses << @response
		if @response.save
			@question = Question.find(answer.question_id)
			redirect_to questions_path
		end
		# render nothing: true

	end

	private
	def response_params
		params.require(:response).permit(:body)
	end
end
