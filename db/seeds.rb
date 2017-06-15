# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create(:username => "admin", :password => "test", :first_name => "Test", :last_name => "User", :user_status => "ACTIVE", :role => "ADMIN")

apps = [
    {
      :name => "ANC",
      :url  => "http://appserver/anc",
      :icon => "anc.png",
      :user => (User.first.id rescue 1)
    },
    {
      :name => "ART",
      :url  => "http://appserver/art",
      :icon => "art.png",
      :user => (User.first.id rescue 1)
    },
    {
      :name => "CCC",
      :url  => "http://appserver/ccc",
      :icon => "ccc.png",
      :user => (User.first.id rescue 1)
    },
    {
      :name => "Maternity",
      :url  => "http://appserver/maternity",
      :icon => "maternity.png",
      :user => (User.first.id rescue 1)
    },
    {
      :name => "OPD",
      :url  => "http://appserver/opd",
      :icon => "opd.png",
      :user => (User.first.id rescue 1)
    },
    {
      :name => "Pharmacy",
      :url  => "http://appserver/pharmacy",
      :icon => "pharmacy.png",
      :user => (User.first.id rescue 1)
    },
    {
      :name => "Radiology",
      :url  => "http://appserver/radiology",
      :icon => "radiology.png",
      :user => (User.first.id rescue 1)
    },
    {
      :name => "Under 5",
      :url  => "http://appserver/u5",
      :icon => "u5.png",
      :user => (User.first.id rescue 1)
    },{
      :name => "eBRS",
      :url  => "http://localhost:3002",
      :icon => "born.png",
      :user => (User.first.id rescue 1)
    },
    {
      :name => "eDRS",
      :url  => "http://localhost:3000",
      :icon => "death.png",
      :user => (User.first.id rescue 1)
    }
  ]
  
  
apps.each do |app|

  record = Application.create(:application_name => app[:name], :url => app[:url], :icon_link => app[:icon], :user_id => app[:user])
  
  src = "#{Rails.root}/db/data/images/#{app[:icon]}"
  
  if File.exists?(src)
  
    puts "Copying file #{app[:icon]}..."
  
    FileUtils.copy(src, "#{Rails.root}/public/data/#{app[:icon]}")
    
  end

end
