require 'spec_helper'
describe QuestionsController, :type => :controller do

	context "#index" do
		let(:question) { create :question }
		let(:user) { create :user }
		it "should return a 200 status code" do
			get :index
			expect(response.status).to be(200)
		end

		it "assigns @questions the set of ordered questions" do
			get :index
			expect(assigns(:questions)).to eq Question.order(created_at: :desc)
		end

		it "generates and recognizes the create route" do
			assert_routing({ path: 'questions', method: :post }, { controller: 'questions', action: 'create' })
		end

		it "should create a new question" do
			expect {
				post :create, :user_id => user.id, :question => attributes_for(:question)
				expect(response).to be_success
			}.to change{ Question.count }.by(1)
		end
	end

	context "#show" do
		it "should return a 200 status code" do
			question_path, id="1"
			expect(response.status).to be(200)
		end
	end
end