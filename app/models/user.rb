class User < ActiveRecord::Base
  has_many :events
  has_many :attendees

  #Oauth認証で取得した情報をDBに登録するメソッド
  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      user.name = auth_hash['info']['name']
      user.nickname = auth_hash["info"]["nickname"]
      user.image = auth_hash['info']['image']
      user.description = auth_hash['info']['description']
      user.token = auth_hash['credentials']['token']
      user.secret = auth_hash['credentials']['secret']
      user.save!
      user
    end
  end
end
