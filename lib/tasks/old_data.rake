namespace :old_data do

  desc "Import species"
  task :import_species => [:environment] do |t|
    incomplete_species = []
    existing_species = []
    added_species = []
    Species.transaction do
      File.foreach('db/old_data/species.csv') do |line|
        species = line.split(/,|\//)[0..7].each_with_index do |item, index|
          item.strip!
          index == 1 ? item.downcase! : item.capitalize!
        end

        species_name = species[0] + " " + species[1]
        species[1] = species_name

        if species.any? { |field| field.empty? }
          incomplete_species << species
        elsif Species.where(name: species[1], genus: species[0]).first
          existing_species << species
        else
          s = Species.new
          s.genus, s.name, s.familia, s.ordo, s.subclassis, s.classis, s.subphylum, s.phylum = species

          s.save!
          added_species << species
        end
      end
    end

    puts "Species import complete \n#{added_species.length} species imported\n#{existing_species.length} species already present in the database\n#{incomplete_species.length} species not added due to incomplete data"
  end

end
