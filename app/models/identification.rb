class Identification
  include Mongoid::Document
  field :name, type: String
  field :identical_id, type: String
  field :address, type: String
  field :phonenumber, type: String
  

  NUMBER_FORMAT=/\d{11}/
  validates :phonenumber, 
  format: { with: NUMBER_FORMAT, 
    :message => '手机号码必须是11位数字'},allow_nil: true
  validates :address,length: { minimum: 10, maximum: 50 },
                     if: Proc.new { |m| !m.address.blank?}

  # if: Proc.new { |m| !m.address.blank?}附属加逗号
  validates :identical_id,
  format: { with: /\d{18}/}
  validates :identical_id,uniqueness: true

  
  # validates_uniqueness_of :identical_id 不混用
  validates :name, length: { minimum: 2, maximum: 4 }


end
