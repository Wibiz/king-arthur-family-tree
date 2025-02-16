Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "process_commands", to: "family_commands#process_file"
    end
  end
end
