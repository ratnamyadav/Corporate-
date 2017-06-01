class RemoveCompanyIdFromDeals < ActiveRecord::Migration[5.0]
  def change
    remove_reference :deals, :company, foreign_key: true
  end
end
