require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do
 it "Includes the default values" do
    assign(:session, Session.new(name: "Bob"))

    render

    expect(rendered).to match /value="Bob"/
  end
end
