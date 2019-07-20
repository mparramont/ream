require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :input_data => "Input Data",
      :output_data => "Output Data"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Input Data/)
    expect(rendered).to match(/Output Data/)
  end
end
