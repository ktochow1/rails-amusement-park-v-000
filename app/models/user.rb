class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates :password, presence: true

  def mood
    if self.happiness < self.nausea
      return "sad"
    else self.happiness > self.nausea
      return "happy"
    end
  end
end
