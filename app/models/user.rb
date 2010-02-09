class User < ActiveRecord::Base
	has_many :lista_de_tareas
	acts_as_authentic
end
