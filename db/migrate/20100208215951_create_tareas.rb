class CreateTareas < ActiveRecord::Migration
  def self.up
    create_table :tareas do |t|
      t.string :nombre
	  t.references :lista_de_tarea
      t.timestamps
    end
  end

  def self.down
    drop_table :tareas
  end
end
