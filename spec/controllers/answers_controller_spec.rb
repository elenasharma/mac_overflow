# before(:each) do
#   @answer = FactoryGirl.create(:answer)
# end

require 'spec_helper'
describe AnswersController, type: :controller do 

	let!(:question) {create :question}
	let!(:answer) {create :answer}
	context "#create" do
		it "creates a new answer" do 
			expect {
				post :create, :question_id => question.id, :answer => attributes_for(:answer)
			}.to change{Answer.count}.by(1)
		end
		it "redirects back to the question page after creating an answer" do 
			expect {
				post :create, :question_id => question.id, :answer => attributes_for(:answer)
				response.should redirect_to controller: :questions, action: :show
			}
		end
		it "creates a new answer that corresponds to the given question" do
			expect {
				post :create, :question_id => question.id, :answer => attributes_for(:answer)
					expect Answer.last.question_id to eq(question.id)
			}
		end
	end

end