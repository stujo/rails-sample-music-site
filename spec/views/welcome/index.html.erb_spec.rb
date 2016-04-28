require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :view do
 it "Says Welcome" do
 	# For more interesting templates
    # assign(:widgets, [
    #   stub_model(Widget, :name => "slicer"),
    #   stub_model(Widget, :name => "dicer")
    # ])

    render

    expect(rendered).to match /Welcome/
  end
end
