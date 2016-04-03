class User < ActiveRecord::Base
  validates :username, presence: true, allow_blank: false, uniqueness: true, format: {with: /[a-z]{6,15}/, message: 'Username should be 6 to 15 lowercase letters'}
  validates :password, presence: true, allow_blank: false

  has_many :sessions, dependent: :destroy

  def self.authenticate(username, password)
    User.find_by(username: username, password: password)
  end
end
