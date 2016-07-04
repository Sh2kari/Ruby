class User < ActiveRecord::Base
  resourcify
  rolify

  include Omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  before_save  :ensure_authentication_token
  after_create :create_user_profile
  after_create :set_role!

  belongs_to :organization

  has_one :profile, dependent: :destroy
  has_many :social_profiles

  has_many :orders

  accepts_nested_attributes_for :profile

  delegate :first_name, :last_name, to: :profile, allow_nil: true

  private

  def create_user_profile
    build_profile
    profile.save(validates: false)
  end

  def set_role!
    if User.count == 1
      add_role(:admin)
    else
      add_role(:user)
    end
  end

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.exists?(authentication_token: token)
    end
  end
end
