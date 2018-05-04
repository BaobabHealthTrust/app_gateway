Rails.application.routes.draw do
	get "/" => "home#index"
	get "/home/ajax_links" => "home#ajax_links"
	get "/admin/" => "admin#index"
	get "/admin/index" => "admin#index"
	get "/admin/login" => "admin#login"
	get "/admin/ajax_apps_list" =>"admin#ajax_apps_list"
	get "/home/log_app/:id" => "home#log_app"
	get "/admin/void/:id" => "admin#void"
	post "/update_app" => "admin#update_app"
	
end
