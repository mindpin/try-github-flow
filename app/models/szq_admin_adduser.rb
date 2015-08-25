class SzqAdminAdduser
  include Mongoid::Document
  include Mongoid::Timestamps
  field :card_id,type: String
  field :name,type: String
  field :tel,type: String
  field :address,type: String

  validates :card_id, :name,  presence: true
  validates :name, length: 2..4
  validates :card_id,
            :format => { with: %r{\d{18}} },
            uniqueness: true
  validates :tel, :format => { with: %r{\d{11}} },
            if: Proc.new { |m| !m.tel.blank?}

  validates :address, length: 10..50,
            if: Proc.new { |m| !m.address.blank?}
end
