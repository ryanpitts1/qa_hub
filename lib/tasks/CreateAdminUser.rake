namespace :db do 
  desc "create an admin user" 
    task :create_admin_user => :environment do 
    admin = User.create( 
      :name => "Admin User",
      :email => "adminuser@domain.com",
      :password => "password", 
      :password_confirmation => "password", 
      :admin => true
    ) 
    admin.save 
  end 
end 