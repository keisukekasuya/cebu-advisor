class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :advisor_id
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
