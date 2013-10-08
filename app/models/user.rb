class User < ActiveRecord::Base
  attr_accessible :name, :token, :password
  # validates :password, length: { minimum: 6 }
  validates :name, presence: true

  has_many :gardens
  has_many :notes
  has_many :crops, through: :gardens
  has_many :garden_memberships
  has_many :member_gardens, through: :garden_memberships, source: :garden

  after_initialize :ensure_session_token

  def self.find_by_credentials(name, password)
    user = User.find_by_name(name)
    return nil if user.nil?

    user
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(password)
    @password = password
  end

  private
    def ensure_session_token
      self.token ||= self.class.generate_session_token
    end
end
