class User < ActiveRecord::Base
  has_many :spots

  validates :first_name, :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\w@/
end
