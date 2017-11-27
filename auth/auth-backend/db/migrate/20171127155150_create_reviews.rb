class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :wait_time, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
