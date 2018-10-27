class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.string :value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
