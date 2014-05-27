namespace :data do
  task admin: :environment do
    Admin.create!(email: 'admin@blog.com', password: '12345678')
  end
end