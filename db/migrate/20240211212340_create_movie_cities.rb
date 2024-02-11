class CreateMovieCities < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_cities do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: { to_table: :cities }

      t.timestamps
    end
  end
end
