class User < ActiveRecord::Base
  has_many :posts

  validates :name, :email, :password, :presence => :true
end
