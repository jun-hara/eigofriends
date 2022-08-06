class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.integer :season
      t.string :status, default: "hidden"

      t.timestamps
    end
  end
end
