require 'spec_helper'
describe QuestionsController, :type => :controller do
	context "#index" do
		it "should return a 200 status code" do
			get :index
			response.status.should be(200)
		end

		it "assigns @questions to Question.all" do
			get :index
			expect(assigns(:questions)).to eq Question.all
		end

		it "a user can create a new question" do

	end

	context "#show" do
		it "should return a 200 status code" do
			question_path, id="1"
			response.status.should be(200)
		end

		# it "accesses that @question is assigned to question" do
		# 	get :show, :id => question.id
		# 	expect(assigns(:question)).to eq question
		# end

		# it "assigns @answers to @question.answers" do
		# 	question_path, id="1"
		# 	expect(assigns(:answers)).to eq :question.answers
		# end
	end
end