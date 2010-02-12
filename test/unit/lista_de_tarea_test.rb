require 'test_helper'

class ListaDeTareaTest < ActiveSupport::TestCase
    
	test "tarea vacia" do
		lt = ListaDeTarea.new
		assert !lt.save
	end
	
	test "lista de tarea save" do
		cant_lt = ListaDeTarea.count
		ListaDeTarea.create(:nombre => "nueva_lista")
		assert_equal cant_lt+1, ListaDeTarea.count
	end
end
