class AddSfIdToRevenues < ActiveRecord::Migration[5.0]
  def change
    add_column :revenues, :sf_id, :string
  end
end
