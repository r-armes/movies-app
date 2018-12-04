class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :genre
      t.string :director
      t.integer :duration
      t.text :description
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
