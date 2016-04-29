require 'rails_helper'

RSpec.describe "users/new.html.erb", type: :view do
 it "Includes the default values" do
    assign(:user, User.new(name: "Bob"))

    render

    expect(rendered).to match /value="Bob"/
  end
end
