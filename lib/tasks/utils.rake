namespace :utils do

  desc "Setup Development"
  task setup_dev: :environment do
    puts "Executando o setup para desenvolvimento..."

    images_path = Rails.root.join('public','system')
    
    puts "APAGANDO BD... #{%x(rake db:drop)}"
    puts "Apagando imagens de public/system #{%x(rm -rf #{images_path})}"
    puts "CRIANDO BD... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake utils:generate_admins)
    puts %x(rake utils:generate_members)
    puts %x(rake utils:generate_ads)

    puts "Setup completado com sucesso!"
  end

  desc "Gerar 10 administradores"
  task generate_admins: :environment do
    puts "Gerando administradores..."
    10.times do
      Admin.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "123456", password_confirmation: "123456", role: [0,1].sample)
    end
    puts "Gerando administradores...[OK]"
  end

  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    puts "Cadastrando ANÚNCIOS..."

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator.paragraph(Random.rand(3)),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public', 'template', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
        )
    end

    puts "Cadastrando ANÚNCIOS... [OK]"
  end

  desc "Cria Membros Fake"
  task generate_members: :environment do
    puts "Cadastrando MEMBROS..."

    10.times do
      Member.create!(
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
      )
    end

    puts "MEMBROS cadastrados com sucesso!"
  end
  
end
