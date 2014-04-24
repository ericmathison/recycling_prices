require 'spec_helper'

describe RecyclingCenter do
  it 'is invalid without any params' do
    expect(RecyclingCenter.new).to be_invalid
  end

  it 'is invalid if one of the required attributes is missing' do
    invalid_attrs = attributes_for(:recycling_center)
    invalid_attrs.delete(:name)
    expect(RecyclingCenter.new(invalid_attrs)).to be_invalid
  end

  it 'is valid when all appropriate attributes are given' do
    expect(build(:recycling_center)).to be_valid
  end
end
