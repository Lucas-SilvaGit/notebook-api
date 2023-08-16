class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true

  def author
    "John Smith"
  end
end
