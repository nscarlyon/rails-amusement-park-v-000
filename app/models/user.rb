class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

#  validates :password, :presence => true

  has_secure_password

  def mood
    if self.nausea.nil? || self.happiness.nil?
      return "No mood"
    elsif
      self.nausea > self.happiness
      return "sad"
    else
      return "happy"
    end
  end

end
