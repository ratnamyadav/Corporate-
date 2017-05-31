class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.belongs_to :company, foreign_key: true
      t.date :date
      t.integer :no_of_erp_closed, default: 0
      t.integer :total_no_of_early_checkout, default: 0
      t.integer :total_no_of_erp, default: 0
      t.integer :no_of_ms_closed, default: 0
      t.integer :total_no_of_ms, default: 0
      t.integer :unique_no_of_ms, default: 0
      t.integer :no_of_cc_closed, default: 0
      t.integer :total_no_of_cc, default: 0
      t.integer :unique_no_of_cc, default: 0
      t.integer :no_of_wsr_closed, default: 0
      t.integer :total_no_of_wsr, default: 0
      t.integer :unique_no_of_wsr, default: 0

      t.timestamps
    end
  end
end
