class SzqAdminAdduser
  include Mongoid::Document
  include Mongoid::Timestamps
  field :cardId,type: Integer
  field :name,type: String
  field :tel,type: Integer
  field :address,type: String

  validates :cardId, :name,  presence: true
  validates :name, length: 2..4
  validates :cardId, 
            :format => {with: %r{\d{18}}, message: 'ID number format is wrong'}, 
            uniqueness: true
  validates :tel, :format => { 
            with: %r{\d{11}}, message: 'telephone format is wrong'},
            if: Proc.new { |m| !m.tel.blank?}

  validates :address, length: 10..50,
            if: Proc.new { |m| !m.address.blank?}
end
