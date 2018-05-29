require 'socket'
require 'resolv-replace'

class HomeController < ApplicationController
  def index  
    @site = YAML.load_file("#{Rails.root}/config/settings.yml")[Rails.env]["site"] rescue "Facility Name" 
  end
  
  def ajax_links
    
    page = params[:page].to_i rescue 1
    
    page = 1 if params.nil? or page < 1
    
    if page == 1
      pagesize = 11 
      
      startpos = 0
    else
      pagesize = 10
      
      startpos = 11 + ((page - 2) * 10)
    end
    
    apps = {}
    
    Application.offset(startpos).limit(pagesize).each do |app|
      ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
      url = "#{app.url}?portal_url=#{ip.ip_address}:#{request.env["SERVER_PORT"]}"
      apps[app.application_name] = [url, app.icon_link, app.id]
    
    end
    
    render :json => apps.to_json
    
  end

  def log_app
  
    Frequency.create(:application => params["id"], :client => request.remote_ip) rescue nil
    
    render :text => "Logged!"
  
  end

end
