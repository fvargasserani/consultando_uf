class CreateUfs < ActiveRecord::Migration[6.0]
  def change
    create_table :ufs do |t|
      t.date :date
      t.float :value

      t.timestamps
    end
  end
end
