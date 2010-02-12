#Correr los tests parado en stories
require '../test_helper'

class ListsStoriesTest < ActionController::IntegrationTest

  def setup
	@user = User.create(:login => "juanma", :email => "juan@ma.com", :password => "secreto", :password_confirmation => "secreto")
    @lista_de_tarea = @user.lista_de_tareas.create!(:nombre => "laburo" )
	login('juanma', 'secreto')
	click_link "Mis Listas de Tareas"
  end

  story "Como usuario me quiero loguear para ver y administrar mis tareas" do


    scenario "dado un usuario valido se muestran las listas de ese usuario" do
      # login('juanma', 'secreto')
	  # click_link "Mis Listas de Tareas"
	  assert_contain "juanma"
      assert_contain "laburo"
    end

    scenario "se agrega una lista" do
      # login('juanma', 'secreto')
	  # click_link "Mis Listas de Tareas"
      assert_contain "Nueva Lista de Tareas"
	  click_link "Nueva Lista de Tareas"
      fill_in :nombre, :with => "New List"
      click_button "Create"
      assert_contain "La Lista de Tareas fue creada satisfactoriamente"
	  assert_contain "New List"
    end
	
	scenario "se intenta agregar una lista vacia" do
      # login('juanma', 'secreto')
	  # click_link "Mis Listas de Tareas"
      assert_contain "Nueva Lista de Tareas"
	  click_link "Nueva Lista de Tareas"
      click_button "Create"
      assert_contain "Nombre can't be blank"
	end

	scenario "un usuario intenta ver una lista de otro usuario" do
	  user2 = User.create(:login => "testusr", :email => "test@usr.com", :password => "secretoa", :password_confirmation => "secretoa")
	  lt = user2.lista_de_tareas.create!(:nombre => "lista_user2")
	  visit "/lista_de_tareas/#{lt.id}"
	  assert_contain "Intentaste ver o editar una lista que no te pertenece"
	end
	
    scenario "muestra una lista" do
      # login('juanma', 'secreto')
	  # click_link "Mis Listas de Tareas"
      click_link "laburo"
      assert_contain "Agregar Tarea"
    end

    scenario "editar una lista" do
	  click_link "Editar"
      fill_in :nombre, :with => "new name"
      click_button "Update"
      assert_contain "Se actualizo la lista de tareas"
    end
	
	
   end

end
