require 'rails_helper'

RSpec.describe Event, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Association' do
    it { should belong_to(:user)}
    it { should have_many(:attendees)}
  end

  describe 'Validation' do

    context 'valid event' do
      let(:event) { create :event }
      it { expect(event).to be_valid }
    end

    context 'title' do
      it { should validate_presence_of :title }
      it { should validate_length_of(:title).is_at_most(50) }
      it { should validate_uniqueness_of :title }
    end

    context 'hold_at' do
      it { should validate_presence_of :hold_at }
    end

    context 'capacity' do
      it { should validate_presence_of :capacity }
      it { should validate_numericality_of(:capacity).only_integer.is_greater_than_or_equal_to(1).is_less_than_or_equal_to(100) }
    end

    context 'location' do
      it { should validate_presence_of :location }
    end

    context 'owner' do
      it { should validate_presence_of :owner }
    end

    context 'description' do
      it { should validate_presence_of :description }
      it { should validate_length_of(:description).is_at_most(2000) }
    end

  end
end
