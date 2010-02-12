#Correr los tests parado en stories
require '../test_helper'

class UserTest < ActionController::IntegrationTest

  def setup
	@user = User.create(:login => "juanma", :email => "juan@ma.com", :password => "secreto", :password_confirmation => "secreto")
  end

  story "login correcto" do

    scenario "se ingresa usuario valido y se accede correctamente" do
		login('juanma','secreto')	
		assert_contain "Bienvenido juanma!"
    end
	
  end

  story "login incorrecto" do

	scenario "usuario inexistente" do
		login('ssddf','pass')
		assert_contain "Login is not valid"
    end
	
	
	scenario "dado un usuario valido se provee un password invalido" do
		login('juanma','invalid')
		assert_contain "Password is not valid"
    end

    scenario "no se llena ni el login ni el password" do
		login('', '')
		assert_contain "You did not provide any details for authentication."
    end

    scenario "no se llena el password" do
		login('juanma', '')
		assert_contain "Password cannot be blank"
    end

    scenario "no se llena el login" do
		login('','secreto')
		assert_contain "Login cannot be blank"
    end
	

  end

  story "registracion" do
  
    scenario "usuario valido se registra correctamente" do
		visit "/"
		click_link "Registrar"
		fill_in :login, :with => "juanma2"
		fill_in :email, :with => "godd@ma.com"
		fill_in :password, :with => "secreto2"
		fill_in :user_password_confirmation, :with => "secreto2"
		click_button "Enviar"
		assert_contain "Se ha registrado satisfactoriamente"
    end

    scenario "dada informacion invalida se muestran las validacions correspondientes" do
		visit "/"
		click_link "Registrar"
		click_button "Enviar"
		assert_contain "Password confirmation is too short (minimum is 4 characters)"
		assert_contain "Password is too short (minimum is 4 characters)"
		assert_contain "Password doesn't match confirmation"
		assert_contain "Login is too short (minimum is 3 characters)"
		assert_contain "Login should use only letters, numbers, spaces, and .-_@ please."
		assert_contain "Email is too short (minimum is 6 characters)"
		assert_contain "Email should look like an email address."
    end
  end

end

