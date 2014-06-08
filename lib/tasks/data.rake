namespace :data do
  task admin: :environment do
    Admin.create!(email: 'admin@blog.com', password: '12345678')
  end
  
  task recreate_versions: :environment do
    Document.all.each { |document| document.file.recreate_versions! }
  end
end