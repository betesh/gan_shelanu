Rails.application.routes.draw do
  controller :main do
    get :home
    post :contact_us
  end
end
