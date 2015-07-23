require 'spec_helper'

describe ApiResource do
  it 'has a version number' do
    expect(ApiResource::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
