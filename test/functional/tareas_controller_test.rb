require 'test_helper'

class TareasControllerTest < ActionController::TestCase

  def setup
	usr  = User.create(:login=>"jack",:email=>"juanmaflyer@gmail.com",:password=>"asdfg",:password_confirmation=>"asdfg")
	usr2 = User.create(:login=>"juanmaflyer",:email=>"other@mail.com",:password=>"asdfg",:password_confirmation=>"asdfg")
    ## Esta linea activa el authlogic... encontrar una solucion a esto porque es horrible!
	Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)
	session = UserSession.create(:login=>"jack",:password=>"asdfg")
	lt = lista_de_tareas(:lt1)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tarea" do
    assert_difference('Tarea.count') do
      post :create, :tarea => { :nombre => "Nombre Prueba" }
    end

    assert_redirected_to tarea_path(assigns(:tarea))
  end

  test "should get edit" do
    get :edit, :id => tareas(:one).to_param
    assert_response :success
  end

  test "should update tarea" do
    put :update, :id => tareas(:one).to_param, :tarea => { }
    assert_redirected_to tarea_path(assigns(:tarea))
  end

  test "should destroy tarea" do
    assert_difference('Tarea.count', -1) do
      delete :destroy, :id => tareas(:one).to_param
    end

    assert_redirected_to tareas_path
  end
end
