class Deal < ApplicationRecord
  belongs_to :company

  validates_presence_of :corporate_finance_id
end
