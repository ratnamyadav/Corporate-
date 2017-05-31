class Company < ApplicationRecord
  validates_presence_of :name
    
  validates :contact, length: {minimum: 9, maximum: 9}, if: :contact_present?

  has_many :revenues, dependent: :destroy
  has_many :deals, dependent: :destroy

  def calculate_month_expenses(month, year)
    
  end

  def contact_present?
    contact.present?
  end
end
