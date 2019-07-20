require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :input_data => "Input Data",
        :output_data => "Output Data"
      ),
      Item.create!(
        :input_data => "Input Data",
        :output_data => "Output Data"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Input Data".to_s, :count => 2
    assert_select "tr>td", :text => "Output Data".to_s, :count => 2
  end
end
