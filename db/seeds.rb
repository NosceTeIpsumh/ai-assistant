# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Item.destroy_all


puts "Creating items..."


Item.create!(user_id: name: "Flocon d'avoine", brand: "Bjorg", category:"glucide", indice_gly: 55, ratio_glucide:60)
puts "Created item"
Item.create!(name: "Riz basmati", brand: "Taureau Ailé", category:"glucide", indice_gly: 50, ratio_glucide:77)
puts "Created item"
Item.create!(name: "Chocolat noir 85%", brand: "Lindt Excellence", category:"glucide", indice_gly: 25, ratio_glucide:19)
puts "Created item"
Item.create!(name: "Miel de fleurs", brand: "Lune de Miel", category:"glucide", indice_gly:60, ratio_glucide:82)
puts "Created item"
Item.create!(name: "Pomme", brand: "Golden", category:"glucide", indice_gly: 38, ratio_glucide:12)
puts "Created item"


puts "Finished! Created #{Item.count} items."
