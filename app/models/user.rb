class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :is_vip, type: Boolean

  has_many :zhou_jianbin_orders
end