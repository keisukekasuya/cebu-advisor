class AddPasswordDigestToAdvisors < ActiveRecord::Migration[5.2]
  def change
    add_column :advisors, :password_digest, :string
  end
end
