class ResponsesController < ApplicationController
	def new	
		@response = Response.new
		@answer = Answer.find(params[:answer_id])
		render partial: "new", locals: {response: @response}
	end

	def create
		@answer = Answer.find(params[:answer_id])
		@answer.responses << @response = Response.create(response_params)
		render partial: "show", locals: {response: @response}
	end

	private
	def response_params
		params.require(:response).permit(:body)
	end
end
