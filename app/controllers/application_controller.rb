class ApplicationController < ActionController::Base
    # Garante que o usuário esteja autenticado antes de acessar qualquer controlador
    before_action :authenticate_user!
  
    # Método para redirecionar após o login
    def after_sign_in_path_for(resource)
      medications_path # Redireciona para a lista de medicamentos após o login
    end
  end 