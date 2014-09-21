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
	end

	context "#show" do
		it "should return a 200 status code" do
			question_path, id="1"
			response.status.should be(200)
		end

		let(:question) { create :question }
		it "assigns @answer" do
			question_path, id="1"
			# assigns(:answer).should_not be_nil
			expect(assigns(:answer)).to eq Answer.new
		end

		# it "accesses that @question is assigned to question" do
		# 	get :show, :id => question.id
		# 	expect(assigns(:question)).to eq question
		# end

		# it "assigns @answers to @question.answers" do
		# end
	end
end