class Activity < ActiveRecord::Base
  belongs_to :language
  belongs_to :course

  def validate
    errors.add :period_from, 'out of course period' if !within_course_period?
    errors.add :period_to, 'out of course period' if !within_course_period?
    errors.add :period_from, 'Overlaps other activities' if overlaps_other_activities?
    errors.add :period_to, 'Overlaps other activities' if overlaps_other_activities?

    errors.add :period_to, 'End date cannot be less than start date' if self.period_to < self.period_from
  end

private
  def within_course_period?
    return self.period_from >= self.course.period_from &&
            self.period_to <= self.course.period_to
  end

  def overlaps_other_activities?
    return self.language.activities.select do |a|
      a.period_from <= self.period_from && a.period_to >= self.period_from && a.period_to <= self.period_to ||
              a.period_to >= self.period_to && a.period_from >= self.period_from && a.period_from <= self.period_to ||
              a.period_from >= self.period_from && a.period_to <= self.period_to ||
              a.period_from <= self.period_from && a.period_to >= self.period_to
    end.length > 0
  end
end
