module GanShelanu
  class Engine < ::Rails::Engine
    initializer "configure simple_form" do
      configure_simple_form
    end
  end
end
