<<<<<<< HEAD
class SzqShanOrder
  include Mongoid::Document
  include Mongoid::Timestamps
  field :total, type: Integer
  belongs_to :user

  def amount
    if self.user.is_vip?
      # self.total*=0.9
      self.total*0.9
    else
      self.total
    end
  end

end
=======
class SzqShanOrder
  include Mongoid::Document
  include Mongoid::Timestamps

  field :total, type: Integer

  belongs_to :user

  def amount
    if self.user.is_vip?
      total*9/10
    else
      total
    end
  end
end
>>>>>>> 5a12a618c06b836e967735b5d795d572ce35b2df
