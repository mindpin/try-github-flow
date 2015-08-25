class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  field :company_name, type: String
  field :company_address, type: String

  has_many :employees
  has_many :teams

  # 公司名称 长度必须大于 2 小于 20
  # 地址 住址长度必须大于 10 小于 50
  validates :company_name, length: 2..20
  validates :company_address, length: 10..50
end