class CreateFolders < ActiveRecord::Migration[6.0]
  def change
    create_table :folders do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
