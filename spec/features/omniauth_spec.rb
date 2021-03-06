require "rails_helper"

RSpec.describe '/auth', type: :feature do
  subject { page }

  # for Twiiter
  describe '/auth/twitter' do
    let(:user){ create :user }

    context 'success' do
      before do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:twitter] =
          OmniAuth::AuthHash.new({
                                   provider: 'twitter',
                                   uid: user.uid,
                                   info: {
                                     name: user.name,
                                     nickname: user.nickname,
                                     image: user.image,
                                     description: user.description
                                   },
                                   credentials: {
                                     token: user.token,
                                     secret: user.secret
                                   }
                                 })
        visit user_path id: user.id
        click_link 'Twitterでログインする'
      end

      it { current_path.should eq events_path }
      it { should have_content "こんにちは、#{user.name}さん" }
      it { should_not have_content 'ログインに失敗しました。' }
    end

    context 'failure' do
      before do
        OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
        visit user_path id: user.id
        click_link 'Twitterでログインする'
      end

      it { current_path.should eq events_path }
      it { should have_content 'ログインに失敗しました。' }
    end
  end

  # for Facebook
  describe '/auth/facebook' do
    let(:user){ create :user }

    context 'success' do
      before do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:facebook] =
          OmniAuth::AuthHash.new({
                                   provider: 'facebook',
                                   uid: user.uid,
                                   info: {
                                     name: user.name,
                                     nickname: nil,
                                     image: user.image,
                                     description: nil
                                   },
                                   credentials: {
                                     token: user.token,
                                     secret: nil
                                   }
                                 })
        visit user_path id: user.id
        click_link 'Facebookでログインする'
      end

      it { current_path.should eq events_path }
      it { should have_content "こんにちは、#{user.name}さん" }
      it { should_not have_content 'ログインに失敗しました。' }
    end

    context 'failure' do
      before do
        OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
        visit user_path id: user.id
        click_link 'Facebookでログインする'
      end

      it { current_path.should eq events_path }
      it { should have_content 'ログインに失敗しました。' }
    end
  end

  describe 'layout' do
    context 'not logged-in' do
      let(:user){ create :user }

      before do
        visit user_path id: user.id
      end

      it { current_path.should eq user_path id: user.id }
      it { should have_content 'Twitterでログインする' }
      it { should have_content 'Facebookでログインする' }
      it { should_not have_content 'ログアウト' }
    end

    context 'logged-in' do
      let(:user){ create :user }

      before do
        login! user
        visit user_path id: user.id
      end

      it { current_path.should eq user_path id: user.id }
      it { should have_content 'ログアウト' }
      it { should_not have_content 'Twitterでログインする' }
      it { should_not have_content 'Facebookでログインする' }

      context 'exec log-out' do
        before do
          click_link 'ログアウト'
        end

        it { current_path.should eq events_path }
        it { should have_content 'Twitterでログインする' }
        it { should have_content 'Facebookでログインする' }
        it { should_not have_content 'ログアウト' }
      end
    end
  end
end
