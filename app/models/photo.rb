class Photo < ApplicationRecord
  belongs_to :item

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, :path => ":rails_root/public/photos/:id/:filename", :url => "/photos/:id/:filename"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
