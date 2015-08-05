<<<<<<< HEAD
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :is_vip,type: Boolean
  has_many :orders
end
=======
class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :is_vip, type: Boolean
end
>>>>>>> 5a12a618c06b836e967735b5d795d572ce35b2df
