namespace :utils do
  desc "Gerar 10 administradores"
  
  task generate_admins: :environment do
    puts "Gerando administradores..."
    10.times do
      Admin.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "123456", password_confirmation: "123456", role: [0,1].sample)
    end
    puts "Gerando administradores...[OK]"
  end
end
