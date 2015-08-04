class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :is_vip, type: Boolean
end
