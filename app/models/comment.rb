class Comment < ActiveRecord::Base
  belongs_to :resource
  belongs_to :user
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



#NEED TO ADD VALIDATIONS, ESP *'s'
end
