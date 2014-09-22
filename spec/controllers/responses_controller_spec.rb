require 'spec_helper'
describe ResponsesController, :type => :controller do

	context "#new" do
		it "should generate and recognize the new route" do
			new_answer_response_path, id="1"
			expect(response).to be_ok
		end

		it "renders the new response partial" do
			expect(response).to render_template('new')
		end
	end

	# context "#create" do
	# 	let(:answer) { create :answer }
	# 	it "creates a new response" do
	# 		answer_responses_path, id=answer.id
	# 		expect {
	# 			post :create, answer_id: answer.id, :response => attributes_for(:response)
	# 		}.to change{ Response.count }.by(1)
	# 	end
	# end
end