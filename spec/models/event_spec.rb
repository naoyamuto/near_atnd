require 'rails_helper'

RSpec.describe Event, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Association' do

  end

  describe 'Validation' do

    context 'title' do
      it { should validate_presence_of :title }
    end

    context 'hold_at' do
      it 'should be present' do
        should validate_presence_of :hold_at
      end
    end

    context 'capacity' do
      it 'should be present' do
        should validate_presence_of :capacity
      end
    end

    context 'location' do
      it 'should be present' do
        should validate_presence_of :location
      end
    end

    context 'owner' do
      it 'should be present' do
        should validate_presence_of :owner
      end
    end

    context 'description' do
      it 'should be present' do
        should validate_presence_of :description
      end
    end

  end







end
