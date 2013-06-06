class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates :name, :author, :body, :presence => :true

  def tags=(tag_names)
    puts "In the tags method"
    self.tags.clear
    tag_names.split(',').each do |t|
      tag = Tag.find_or_create_by_name(t.strip)
      self.tags << tag
    end
  end
end
