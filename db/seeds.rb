# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

def create_locations
  puts '  BEGIN: Create Locations'
  return unless Location.count.zero?

  Enums::Cities::ALL.map do |city|
    Location.create!(city: city)
  end

  puts "#{Location.count} locations has been created"
  puts '  END: Create Locations'
end

def create_events
  puts '  BEGIN: Create Events'
  return unless Event.count.zero?

  20.times do
    FactoryGirl.create(:event, location_id: Location.pluck(:id).sample)
  end

  puts "#{Event.count} events has been created"
  puts '  END: Create Events'
end

# =====================================
puts 'BEGIN: seeds'

def generate_seed_data_for_development
  puts '  BEGIN: Generating seed data for development environments'

  create_events

  puts '  END: Generating seed data for development environments'
end

def generate_seed_data_for_production
  puts '  BEGIN: Generating seed data for production environments'

  create_events

  puts '  END: Generating seed data for production environments'
end

def generate_seed_data_for_all_environments
  puts '  BEGIN: Generating seed data for all environments'

  create_locations

  puts '  END: Generating seed data for all environments'
end

# =====================================
generate_seed_data_for_all_environments
generate_seed_data_for_development if Rails.env.development?
generate_seed_data_for_production if Rails.env.production?

puts 'END: seeds'
