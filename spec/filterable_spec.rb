require 'spec_helper'

FooModel.include ApiMonkey::Filterable

describe 'Filterable Concern' do
  it 'should provide the filter method' do
    expect(FooModel).to respond_to :filter
  end
end
