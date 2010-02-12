#Correr los tests parado en stories
require '../test_helper'

class TasksStoriesTest < ActionController::IntegrationTest
  
  def setup
	@user = User.create(:login => "juanma", :email => "juan@ma.com", :password => "secreto", :password_confirmation => "secreto")
    @lt = @user.lista_de_tareas.create!(:nombre => "laburo" )
	@tarea = @lt.tareas.create(:nombre => "entregar el proyecto")
	login('juanma', 'secreto')
	click_link "Mis Listas de Tareas"
  end
  
  story "dado un usuario y una lista de tareas se muestra que las tareas andan bien" do

	scenario "se muestra la tarea" do
		click_link "laburo"
		assert_contain("entregar el proyecto")
	end
  
	scenario "se crea una tarea" do
		click_link "laburo"
		click_link "Agregar Tarea"
		fill_in :nombre, :with => "limpiar la casa"
		click_button "Create"
		assert_contain "Nueva tarea creada!"
		assert_contain "limpiar la casa"
    end

    scenario "se edita una tarea" do
		click_link "laburo"
		click_link "Editar"
		assert_contain "Editing tarea"
		fill_in :nombre, :with => "editada"
		click_button "Update"
		assert_contain "La tarea fue modificada satisfacotiramente"
		assert_contain "editada"
    end

	scenario "se intenta editar una tarea en una lista que no le pertenece al usuario" do
		user2 = User.create(:login => "testusr", :email => "test@usr.com", :password => "secretoa", :password_confirmation => "secretoa")
		lt = user2.lista_de_tareas.create!(:nombre => "lista_user2")
		t = lt.tareas.create!(:nombre => "tarea_lista_user2")
		visit "/lista_de_tareas/#{lt.id}/tareas/#{t.id}/edit"
		assert_contain "Intentaste agregar o editar una tarea en una lista que no te pertenece"
	end

  end
end

