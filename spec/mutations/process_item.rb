require 'rails_helper'

describe ProcessItem do
  subject { described_class.run!(input_data: open('data.json')) }
  it 'augments an item with more info from pictures and text' do
    ap subject
  end
end
