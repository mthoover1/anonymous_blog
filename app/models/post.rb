class Post < ActiveRecord::Base
  has_many :tags, :through => :post_tags
end
