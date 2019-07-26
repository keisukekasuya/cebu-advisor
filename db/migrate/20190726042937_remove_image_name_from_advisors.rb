class RemoveImageNameFromAdvisors < ActiveRecord::Migration[6.0]
  def change

    remove_column :advisors, :image_name, :string
  end
end
