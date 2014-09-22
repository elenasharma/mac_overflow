require 'spec_helper'
describe ResponsesController do

	context "#new" do
		it "renders the new response partial" do
			# assign(:response, [Response.create!])
			# render

			# expect(view).to render_template("new")
			render
			assert_template partial: '_new'
		end
	end
end