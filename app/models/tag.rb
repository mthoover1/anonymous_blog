class Tag < ActiveRecord::Base
  has_many :tags, :through => :post_tags
end
