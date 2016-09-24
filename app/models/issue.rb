class Issue < ApplicationRecord
  mount_uploaders :images, ImagesUploader
end
