class User < ApplicationRecord
  devise :database_authenticatable

  EMAIL_REGEXP = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  validates :email, uniqueness: true, format: { with: EMAIL_REGEXP, message: 'Invalid email address.' }, allow_nil: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :password, presence: true, length: { minimum: 6 }, unless: 'provider', on: :create
  validates :location, presence: true
  has_many :user_role_mappings
  has_many :roles, through: :user_role_mappings

  after_create :create_default_role

  def self.from_omniauth(auth) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    ActiveRecord::Base.transaction do
      first_name, last_name = auth.info.name.split(' ')

      user = where(auth.slice(:provider, :uid).to_h).first_or_initialize(
        provider: auth.provider,
        uid: auth.uid,
        first_name: first_name,
        last_name: last_name,
        image: auth.info.image,
        location: auth.info.location,
        oauth_token: auth.credentials.token,
        oauth_expires_at: Time.zone.at(auth.credentials.expires_at),
        email: auth.info.email
      )

      user.save(validate: false)
      user
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  def admin?
    role_symbols.include?(:admin)
  end

  private

  def create_default_role
    UserRoleMapping.create(role: Role.find_by(name: 'user'), user: self)
  end

  def validate_date_of_brith
    errors.add(:date_of_birth, 'must be of the format DD/MM/YYYY.') unless validate_date_str
  end

  def validate_date_str
    # Since the date_of_birth column is of type timestamp Rails parses the DOB string
    # into a time object, so if 32/12/1987 is entered it can't parse.
    # As a result date_of_birth is nil. That's what the check below this line is for.
    return false if date_of_birth.nil?

    # I want users to enter their date of births as DD/MM/YYYY just to be very clear
    # on formatting and not end up with wrong dates because someone entered it as
    # MM/DD/YYYY
    Date.strptime(date_of_birth.strftime('%d/%m/%Y'), '%d/%m/%Y')
    true
  rescue ArgumentError => _error
    false
  end
end
