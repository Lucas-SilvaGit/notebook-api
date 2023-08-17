class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind, optional: true do          
    link(:related) { kind_url(object.kind.id) }
  end

  has_many :phones
  has_one :address
  
  meta do
    { author: "John Smith"}  
  end
end
