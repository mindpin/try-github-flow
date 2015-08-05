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
