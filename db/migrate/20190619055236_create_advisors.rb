class CreateAdvisors < ActiveRecord::Migration[5.2]
  def change
    create_table :advisors do |t|
      t.string :name
      t.string :email
      t.string :image_name
      t.string :password_digest

      t.timestamps
    end
  end
end
