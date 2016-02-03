require 'spec_helper'

class FooModel
  include ApiMonkey::Filterable
end

describe 'Filterable Concern' do
  it 'should provide the filter method' do
    expect(FooModel).to respond_to :filter
  end
end
