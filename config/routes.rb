Rails.application.routes.draw do
  
  scope module: 'api' do
    namespace :v1 do
      post '/flights/paths', to: 'flights#paths', as: 'paths'
    end
  end

end
