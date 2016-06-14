class Photo < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_attached_file    :imageable,
                       styles: { thumb: ["64x64#", :jpg], original: ['500x500>', :jpg] }
#  validates_attachment :imageable, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
