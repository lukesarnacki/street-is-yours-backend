class IssueSerializer < ActiveModel::Serializer
  attributes :category, :description, :image, :latitude, :longitude, :state

  def image
    object.image.url
  end
end
