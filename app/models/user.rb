class User < ActiveRecord::Base
  attr_accessible :name, :token, :password, :zip, :email
  # attr_reader :password
  validates :password, length: { minimum: 6 }
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true

  has_many :gardens
  has_many :notifications
  has_many :notes
  has_many :crops, through: :gardens
  has_many :garden_memberships
  has_many :member_gardens, through: :garden_memberships, source: :garden
  has_many :lists

  after_initialize :ensure_session_token
  
  def get_users_in_radius(zip, distance)
    local_zips = get_zips_in_radius(zip, distance)
    User.where("zip = ?", current_user.zip).to_a
  end

  def self.find_by_credentials(name, password)
    user = User.find_by_name(name)
    return nil if user.nil? || user.password != password
    user
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  # def password=(password)
  #   @password = password
  # end

  private
    def ensure_session_token
      self.token ||= self.class.generate_session_token
    end
end
