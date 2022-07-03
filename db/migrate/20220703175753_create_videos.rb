class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :titulo
      t.string :descricao
      t.string :url

      t.timestamps
    end
  end
end
