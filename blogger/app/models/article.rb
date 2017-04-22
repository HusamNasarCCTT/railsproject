class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  #Returns a string which contains all the tags separated with a ", " between them.
  def tag_list
    self.tags.collect{ |tag|
      tag.name
    }.join(", ")
  end

  def tag_list=(tag_string)
    tag_names = tag_string.split.collect{ |tag|
      tag.strip.downcase
    }.uniq
    new_or_found_tags = tag_names.collect{ |tag_name|

      Tag.find_or_create_by(name: tag_name);

    }
    self.tags = new_or_found_tags
    #tags.join
  end

end
