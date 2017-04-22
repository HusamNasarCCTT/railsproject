class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  #Basically, telling Rails that the Article Model has the ability to have attachments....
  #And, validating the type of attachments against 3 types of image files "jpg, jpeg, and png"...
  #Paperclip gem method...

  #Developer Note:
  #As of version 4.0, all attachments are required to include a content_type validation, a file_name validation,
  #or to explicitly state that they’re not going to have either.
  #Paperclip raises MissingRequiredValidatorError error if you do not do this.
  #So, we add the validates_attachment_content_type line so that our model will validate that it is receiving a proper filetype.

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

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
