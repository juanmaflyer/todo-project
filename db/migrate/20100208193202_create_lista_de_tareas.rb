class CreateListaDeTareas < ActiveRecord::Migration
  def self.up
    create_table :lista_de_tareas do |t|
      t.string :nombre
	  t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :lista_de_tareas
  end
end
