class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones

  accepts_nested_attributes_for :phones

  def author
    "John Smith"
  end
end
