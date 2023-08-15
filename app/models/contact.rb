class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones

  accepts_nested_attributes_for :phones

  def author
    "John Smith"
  end
  
  def kind_description
    self.kind.description
  end

  def phone_numbers
    phones.pluck(:phone_number)
  end

  def as_json(options={})
    super(
      root: true,
      methods: [:kind_description, :phone_numbers, :author] #esse traz ja de forma o atributo direto na tabela
      # include: { kind: { only: :description} }     esse traz de forma aninhada
    )
  end
end
