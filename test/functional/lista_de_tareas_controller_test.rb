require 'test_helper'

class ListaDeTareasControllerTest < ActionController::TestCase
	
  def setup
	usr  = User.create(:login=>"jack",:email=>"juanmaflyer@gmail.com",:password=>"asdfg",:password_confirmation=>"asdfg")
	usr2 = User.create(:login=>"juanmaflyer",:email=>"other@mail.com",:password=>"asdfg",:password_confirmation=>"asdfg")
	## Esta linea activa el authlogic... encontrar una solucion a esto porque es horrible!
	Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)
	session = UserSession.create(:login=>"jack",:password=>"asdfg")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lista_de_tareas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
	

  test "should create lista_de_tarea" do
    assert_difference('ListaDeTarea.count') do
      post :create, :lista_de_tarea => {:nombre => 'tarea1', :user_id => '1' }
    end

    assert_redirected_to lista_de_tareas_path
  end

  test "should show lista_de_tarea" do
    get :show, :id => lista_de_tareas(:lt1).to_param
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, :id => lista_de_tareas(:lt1).to_param
    assert_response :redirect
  end

  test "should update lista_de_tarea" do
    put :update, :id => lista_de_tareas(:lt1).to_param, :lista_de_tarea => { }
    assert_redirected_to lista_de_tarea_path(assigns(:lista_de_tarea))
  end

  test "should destroy lista_de_tarea" do
    assert_difference('ListaDeTarea.count', -1) do
      delete :destroy, :id => lista_de_tareas(:lt1).to_param
    end

    assert_redirected_to lista_de_tareas_path
  end
end
