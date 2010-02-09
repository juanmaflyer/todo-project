require 'test_helper'

class ListaDeTareasControllerTest < ActionController::TestCase
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
      post :create, :lista_de_tarea => { }
    end

    assert_redirected_to lista_de_tarea_path(assigns(:lista_de_tarea))
  end

  test "should show lista_de_tarea" do
    get :show, :id => lista_de_tareas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lista_de_tareas(:one).to_param
    assert_response :success
  end

  test "should update lista_de_tarea" do
    put :update, :id => lista_de_tareas(:one).to_param, :lista_de_tarea => { }
    assert_redirected_to lista_de_tarea_path(assigns(:lista_de_tarea))
  end

  test "should destroy lista_de_tarea" do
    assert_difference('ListaDeTarea.count', -1) do
      delete :destroy, :id => lista_de_tareas(:one).to_param
    end

    assert_redirected_to lista_de_tareas_path
  end
end
