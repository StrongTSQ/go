class CreateChessboards < ActiveRecord::Migration[5.2]
  def change
    create_table :chessboards do |t|
      t.integer :dimension
      t.string :theme

      t.timestamps
    end
  end
end
