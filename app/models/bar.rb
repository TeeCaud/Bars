class Bar < ApplicationRecord
  has_many :drinks, dependent: :destroy
  validates_presence_of :name
  validates :specials, inclusion: [true, false]
  validates_presence_of :established
  validates_presence_of :location

  def self.sort_by_created_at
    order(created_at: :desc)
  end
end
