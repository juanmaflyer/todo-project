class ListaDeTarea < ActiveRecord::Base
	has_many :tareas, :dependent => :delete_all
	belongs_to :user
	validates_presence_of :nombre
end
