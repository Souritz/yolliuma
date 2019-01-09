class CreateAgeLimits < ActiveRecord::Migration[5.2]
  def change
    create_table :age_limits do |t|
      t.integer :illustration_id

      t.timestamps
    end
  end
end
