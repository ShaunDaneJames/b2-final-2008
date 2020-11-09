Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #doctors
  get '/doctors/:id', to: 'doctors#show'

  #hospitals
  get '/hospitals/:id', to: 'hospitals#show'

  #doctorpatients
  delete '/doctorpatients/:doctor_id/:patient_id', to: 'doctorpatients#destroy'
end
