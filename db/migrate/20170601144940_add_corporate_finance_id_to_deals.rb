class AddCorporateFinanceIdToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :corporate_finance_id, :string
  end
end
