require 'test_helper'

class TareaTest < ActiveSupport::TestCase
  
  test "tarea vacia" do
	tarea = Tarea.new
	assert !tarea.save
  end
  
  test "tarea save" do
	cant_tareas = Tarea.count
	tarea = Tarea.create(:nombre => "nueva_tarea")
	assert_equal(cant_tareas+1,Tarea.count)
  end
  
  # Puedo definir el test de arriba de la siguiente manera:
  # def test_tarea_vacia
	# tarea = Tarea.new
	# assert !tarea.save
  # end
end
