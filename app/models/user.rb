class User < ActiveRecord::Base
	include BCrypt
  has_many :articles

  validates :username, :email, :password_hash, presence: true
  validates :username, :email, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def following
  	following = Follow.where(follower_id: self.id)
  	following.to_a.map!{|i| User.find(i.following_id)} 
  end

  def follower
  	follower = Follow.where(following_id: self.id)
  	follower.to_a.map!{|i| User.find(i.follower_id)}
  end 
end
