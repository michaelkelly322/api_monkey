require 'gem_helper'

FooModel.include ApiMonkey::FilterScopes

describe 'FilterScopes Concern' do
  it 'should provide a filter_xxx method for each column_name' do
    expect(FooModel).to respond_to :filter_amount
  end

  it 'should provide a filter_related method for each relationship' do
    expect(FooModel).to respond_to :filter_related
  end

  it 'should provide a method to build a strong paramter param' do
    expect(FooModel).to respond_to :filter_params
  end

  describe '#filter_params' do
    it 'should build a hash with a key for each column' do
      expect(FooModel.filter_params.keys).to eq [:amount]
    end

    it 'should create the list of permitted operations for each column key' do
      expect(FooModel.filter_params[:amount]).to eq [:eq, :gt, :lt, :geq, :leq]
    end
  end

  describe '#filter_xxx' do
    context 'with simple predicate' do
      it 'should call where with a default equality predicate' do
        expect(FooModel).to receive(:where).with('amount = ?', 0)
        FooModel.filter_amount(0)
      end
    end

    context 'with complex predicate' do
      it 'should call where with the appriate complex predicate' do
        expect(FooModel).to receive(:where).with('amount > ? AND amount < ?', 0, 5)
        FooModel.filter_amount('gt' => 0, 'lt' => 5)
      end
    end
  end

  describe 'filter_related' do
    it 'should call includes with relation name' do
      expect(FooModel).to receive(:includes).with('products').and_return(FooModel)
      FooModel.filter_related('product.name', { 'eq' => 'foo' })
    end

    it 'should call where with the relational query' do
      expect(FooModel).to receive(:where).with('products.name = ?', 'foo')
      FooModel.filter_related('product.name', { 'eq' => 'foo' })
    end

  end

  describe '#filter_args' do
    it 'builds the predicate string with the appropriate operator from OPERANDS' do
      FooModel::OPERANDS.keys.each do |op_string|
        expect(FooModel.filter_args('amount', 0, op_string)[0]).to eq "amount #{FooModel::OPERANDS[op_string]} ?"
      end
    end

    it 'includes the value for the associated predicate' do
      expect(FooModel.filter_args('amount', 0, 'eq')[1]).to eq 0
    end

    it 'includes () for `in` queries' do
      expect(FooModel.filter_args('amount', [0, 5, 10], 'in')).to eq ['amount in (?)', [0,5,10] ]
    end
  end

  describe '#process_hash_params' do
    it 'builds a single predicate with multiple clauses' do
      expect(FooModel.process_hash_params('amount', { 'gt' => 0, 'lt' => 5 })).to eq ['amount > ? AND amount < ?', 0, 5]
    end
  end
end

