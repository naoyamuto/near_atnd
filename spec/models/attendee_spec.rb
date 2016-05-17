require 'rails_helper'

RSpec.describe Attendee, type: :model do

  describe 'Association' do
    it { should belong_to(:event)}
    it { should belong_to(:user)}
  end

  describe 'Validation' do
    let(:event) { create :event }
    let!(:attendee) { create :attendee, event: event }

    it 'hogehoge' do
        attendee.event_id = nil
        expect(attendee).to_not be_valid
    end

    # context 'attendee' do
    #   let!(:attended) { create :attendee, event: event }
    #   it { expect(attended).to be_valid }
    #   attended.event_id = nil
    #   it { expect(attended).to_not be_valid }
    # end
    #
    # context 'not attendee' do
    #   let!(:absented) { create :attendee, event: event, status: 'absented' }
    #   it { expect(absented).to be_valid }
    # end

  end
end
