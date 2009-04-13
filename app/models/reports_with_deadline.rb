class ReportsWithDeadline < ActiveRecord::Base
  belongs_to :course
  belongs_to :report
  belongs_to :user

  def is_editable
    self.status != 2 && self.status != 0
  end

  def finalized?
    self.status == 2
  end
end
