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
