require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Association' do
    it { should have_many(:events)}
    it { should have_many(:attendees)}
  end

end
