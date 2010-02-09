class Tarea < ActiveRecord::Base
	belongs_to :lista_de_tarea
	validates_presence_of :nombre
end
