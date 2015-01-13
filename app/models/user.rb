
  # Remember to create a migration!
    # validates :date, :title, :organizer_name, :organizer_email, :presence => true
  # validate :date_cant_be_in_the_past => true
  # validate :date_is_valid? => true
  # validate :title, :uniqueness => true
  # validate :organizer_email, :format => {with: /.+@+\w..{2,}/}

  # def date_cant_be_in_the_past
  #   if date.present? && date < Date.today
  #     self.errors[:date] << "Date must be higher or equal to today"
  #   end
  # end

  # def date_is_valid?
  #   if !date.is_a?(Date)
  #     self.errors[:date] << 'must be a valid date'
  #   end
  # end

require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :resources
  has_many :comments

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
