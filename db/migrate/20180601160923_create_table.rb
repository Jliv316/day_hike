class CreateTable < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.string :TripTrails
      t.references :trip, foreign_key: true
      t.references :trail, foreign_key: true
    end
  end
end
