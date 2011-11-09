class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, :through => :taggings
  
  def tag_list
    #Keith suggested using map
    # self.tags = array of tag objects
    # Every array has a map
    # map calls a chunk of code for every element
    # does what is in {}
    # returns a new array
    return self.tags.map(&:name).join(", ")
  end
  
  def tag_list=(tags_string)
    self.taggings.destroy_all
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    tag_names.each do |tag_name|
      tag = Tag.find_or_create_by_name(tag_name)
      self.taggings.build(:tag => tag)
    end
  end

end
