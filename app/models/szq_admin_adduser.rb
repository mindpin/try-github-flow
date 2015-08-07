class SzqAdminAdduser
  include Mongoid::Document
  include Mongoid::Timestamps
  field :cardId,type: Integer
  field :name,type: String
  field :tel,type: Integer
  field :address,type: String

  validates :cardId, :name, :tel, :address, presence: true
  validates :name, length: { minimum:2, maximum: 4 , message: 'name necessary between 2 and 4'}
  validates :cardId, :format => {with: %r{\d{18}}, message: 'ID number format is wrong'}, uniqueness: true
  validates :tel, :format => { with: %r{\d{11}}, message: 'telephone format is wrong'}
  validates :address, length: { minimum:10, maximum: 50 , message: 'address necessary between 10 and 50'}
end
