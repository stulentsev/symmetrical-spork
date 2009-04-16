class School < ActiveRecord::Base
  has_many :courses
  belongs_to :coordinator, :class_name => 'Coordinator', :foreign_key => 'coordinator_user_id'

  def current_course
    orders = Course.find( :all,
                           :conditions => {:school_id => self.id},
                           :order => 'id').each do |o|
      return o if o.period_from <= Date.today && o.period_to >= Date.today
    end
    return orders.last
  end
end
