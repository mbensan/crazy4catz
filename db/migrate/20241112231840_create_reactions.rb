class CreateReactions < ActiveRecord::Migration[7.2]
  def change
    create_table :reactions do |t|
      t.string :rtype, null: false, default: 'like'
      t.references :user, null: false, foreign_key: true
      t.references :publication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
