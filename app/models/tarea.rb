class Tarea < ActiveRecord::Base
	validates_presence_of :nombre
	belongs_to :lista_de_tarea
	
end
