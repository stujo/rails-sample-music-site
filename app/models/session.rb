class Session
  include ActiveModel::Model

  attr_accessor :name, :password

  attr_reader :user

  validates :name, presence: true
  validates :password, presence: true

  def authenticate?
    if valid?
      @user = lookup
      return true if @user
      errors.add(:name, "might not be correct")
      errors.add(:password, "might not be correct")
    end
    false
  end

  private
  def lookup
    candidate = User.find_by(name: name)
    return candidate if candidate && candidate.authenticate(password)
    nil
  end
end
