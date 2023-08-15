class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones

  def author
    "John Smith"
  end
  
  def kind_description
    self.kind.description
  end

  def as_json(options={})
    super(
      root: true,
      methods: [:kind_description, :author]         #esse traz ja de forma o atributo direto na tabela
      # include: { kind: { only: :description} }     esse traz de forma aninhada
    )
  end
end
