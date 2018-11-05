class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :github
      t.string :job
      t.boolean :relationship

      t.timestamps
    end
  end
end
