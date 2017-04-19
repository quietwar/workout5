class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user
      t.text :first_name
      t.text :last_name
      t.string :coding
      t.string :project_details
      t.date :start_date
      t.references :user, foreign_key: true
    end
  end
end
