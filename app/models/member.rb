class Member
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :card_id, type: String
  field :phone_num, type: String

  validates :card_id, presence: true
  validates :card_id, uniqueness: true,
            format: {with: %r{\d{18}}}
  validates :name, length: 2..4,
            if: Proc.new { |m| !m.name.blank?}
  validates :phone_num, format: {with: %r{\d{11}}},
            if: Proc.new { |m| !m.phone_num.blank?}
end
