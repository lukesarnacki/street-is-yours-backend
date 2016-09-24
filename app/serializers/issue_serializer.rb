class IssueSerializer < ActiveModel::Serializer
  attributes :category, :description, :image, :latitude, :longitude, :state
end
