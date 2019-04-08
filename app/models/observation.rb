class Observation < ApplicationRecord
  belongs_to :legator, class_name: "User"
  belongs_to :determinator, class_name: "User", optional: true
  belongs_to :species, optional: true
  belongs_to :habitat, optional: true
  belongs_to :substrate, optional: true

  has_many_attached :images

  validates :area, :location, :description, :observed_at, presence: true
  validates :area, :location, length: { minimum: 3, maximum: 100 }
  validates :description, length: { minimum: 10, maximum: 2000 }

  after_create :delegate_number

  def create_habitat(category_id, note = nil, habitat_species_ids = [])
    if category_id.present?
      habitat_category = HabitatCategory.find(category_id)
      habitat = Habitat.new(habitat_category: habitat_category, note: note)
      unless !habitat_species_ids.present? || habitat_species_ids.empty?
        habitat_species_ids.each do |habitat_species_id|
          habitat.floral_species << FloralSpecies.find(habitat_species_id)
        end
      end
      return habitat if habitat.save
    end
    return nil
  end

  def create_substrate(category_id, note = nil, substrate_species_ids = [])
    if category_id.present?
      substrate_category = SubstrateCategory.find(category_id)
      substrate = Substrate.new(substrate_category: substrate_category, note: note)
      unless !substrate_species_ids.present? || substrate_species_ids.empty?
        substrate_species_ids.each do |substrate_species_id|
          substrate.floral_species << FloralSpecies.find(substrate_species_id)
        end
      end
      return substrate if substrate.save
    end
    return nil
  end

  private

    def delegate_number
      next_number = Observation.count + 1
      self.update_attributes(number: next_number.to_s.rjust(6, '0'))
    end
end
