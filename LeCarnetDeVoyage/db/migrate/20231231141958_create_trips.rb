class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.string :destination
      t.text :description
      t.date :dateDebut
      t.date :dateFin

      t.timestamps
    end
  end
end
