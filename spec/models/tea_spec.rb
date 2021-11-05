require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'relationships' do
    # it { should belong_to(:) }
    it { should have_many(:subscriptions) }
    it { should have_many(:customers).through(:subscriptions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:temperature) }
    it { should validate_presence_of(:brew_time) }
  end

  # before :each do
    
  # end

  # describe 'class methods' do
  #   describe '.' do
  #   end
  # end

  # describe 'instance methods' do
  #   describe '#' do
  #   end
  # end
end
