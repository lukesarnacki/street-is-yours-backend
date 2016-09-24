class Issue < ApplicationRecord
  attr_accessor :content_type, :original_filename, :image_data
  enum status: { todo: 0, in_progress: 1, fixed: 2 }
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  before_save :decode_base64_image
  reverse_geocoded_by :latitude, :longitude, :address => :location
  #after_validation :reverse_geocode


  protected

  def decode_base64_image
    if image_data && content_type && original_filename
      decoded_data = Base64.decode64(image_data)

      data = StringIO.new(decoded_data)
      data.class_eval do
        attr_accessor :content_type, :original_filename
      end

      data.content_type = content_type
      data.original_filename = File.basename(original_filename)

      self.image = data
    end
  end
end
