require "rails_helper"

RSpec.describe '/users', type: :feature do
  subject { page }

  let(:user){ create :user }
  before do
    visit user_path id: user.id
  end

  describe '/user/:id' do
    it { should have_content user.name }
    it { should have_content user.nickname }
    it { should have_content user.description }
    it { should have_selector("img[src$='#{user.image}']") }
  end
end
