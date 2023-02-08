class CreateCows < ActiveRecord::Migration[7.0]
  def change
    create_table :cows, id: :uuid do |t|
      t.string :collarId, index: { unique: true }
      t.string :cowNumber, index: { unique: true }

      t.timestamps
    end
  end
end
