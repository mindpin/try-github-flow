class Team
  include Mongoid::Document
  include Mongoid::Timestamps
  field :team_name, type: String

  has_and_belongs_to_many :employees
  belongs_to :company

  # 小组名 长度必须大于 2 小于 10
  validates :team_name, length: 2..10
end