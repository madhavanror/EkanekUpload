class User < ApplicationRecord
  has_secure_password
  has_many :documents

  validates_presence_of :first_name, :last_name, :email, :password
  validates_uniqueness_of :email,
                          presence: true,
                          case_sensitive: false
  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      on: :create

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def self.find_or_create(attr, args = {})
    record = find_or_create_by(attr)
    record.update_attributes(args)
    record
  end
end
