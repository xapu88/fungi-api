class ObservationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :number, :description, :area, :location, :longitude, :latitude, :altitude, :quantity, :explored_surface, :sample, :external_url, :approved, :observed_at, :created_at
  belongs_to :legator, record_type: :user
  belongs_to :determinator, record_type: :user
  belongs_to :species, record_type: :species
  belongs_to :habitat
  belongs_to :substrate

  attribute :species_name do |object|
    object.species.present? ? object.species.name : nil
  end

  attribute :legator_username do |object|
    object.legator.present? ? object.legator.username : nil
  end

  attribute :images do |object|
    imgs = []
    object.images.each do |img|
      imgs << Rails.application.routes.url_helpers.rails_blob_path(img, only_path: true)
    end
    imgs
  end

end
