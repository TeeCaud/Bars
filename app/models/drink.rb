class Drink < ApplicationRecord
  belongs_to :bar
  validates_presence_of :name
  validates :alcohol, inclusion: [true, false]
  validates_presence_of :quantity

  def self.true_records
    where(alcohol: true)
  end
end
