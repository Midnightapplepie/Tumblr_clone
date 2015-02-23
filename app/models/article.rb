class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings
	has_attached_file :image
	validates_attachment_content_type :image, :content_type=>["image/jpg","image/jpeg","image/png"]

	def tag_list
		tags.collect do |tag| 
			tag.name
		end.join(", ")
	end

	def tag_list=(tags_string)
		tags_array = tags_string.split(",").map{|i| i.strip.downcase}.uniq
		tags = tags_array.collect{|name| Tag.find_or_create_by(name: name)}
		self.tags = tags
	end
end
