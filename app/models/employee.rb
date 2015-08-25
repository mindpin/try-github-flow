class Employee
  include Mongoid::Document
  include Mongoid::Timestamps
  field :employee_name, type: String
  field :card_id , type: String
  field :phone_num, type: String

  belongs_to :company
  has_and_belongs_to_many :teams

  # 姓名 长度必须大于 2 小于 4
  # 身份证号 必须是 18 位字符串
  # 手机号 必须是 11 位数字
  validates :employee_name, length: 2..10
  validates :card_id, format: { with: %r{\d{18}}}
  validates :phone_num, format: { with: %r{\d{11}}}

  # validates_each :companies, :teams do |record, attr|
  #   record.errors.add attr, "Relation is wrong" 
  # end
end