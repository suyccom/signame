class HoboMigration2 < ActiveRecord::Migration
  def self.up
    create_table :solicituds do |t|
      t.string   :email_solicitante
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :pagina_id
    end
    add_index :solicituds, [:pagina_id]

    remove_column :paginas, :email_solicitante
  end

  def self.down
    add_column :paginas, :email_solicitante, :string

    drop_table :solicituds
  end
end
