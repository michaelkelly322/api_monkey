require 'gem_helper'

FooModel.include ApiMonkey::Filterable

describe 'Filterable Concern' do
  it 'should provide the filter method' do
    expect(FooModel).to respond_to :filter
  end

  describe '#filter' do
    context 'with nil parameter' do
      it 'should return a nil set' do
        expect(FooModel.filter(nil)).to eq FooModel.where(nil)
      end
    end
  end
end
