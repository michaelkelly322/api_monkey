require 'spec_helper'

class FooModel
  def self.column_names
    ['amount']
  end

  include ApiMonkey::FilterScopes
end

describe 'FilterScope Concern' do
  it 'should provide a filter_xxx method for each column_name' do
    expect(FooModel).to respond_to :filter_amount
  end
end

