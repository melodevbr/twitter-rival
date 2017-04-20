namespace :starter do

  desc "Run starter script for development"
  task :run => :environment do
  	Application.create!(
  		name: 'TIDY', 
  		key: 'a78fb1383c14c6332165bc44c1a364b38d26fc68', 
  		secret: '118a1de593252b71f178cef60ae8b6af7c484a51bead92a6671a2630b548e68e')

  	User.create!(email: 'hotaviano@melo.biz', password: '12345678', password_confirmation: '12345678')
  end

end