module StudentsHelper
  def schooling_ddl form
    form.select :schooling_id, Schooling.find(:all).map {|s| [s.name, s.id]}, { :include_blank => true }
  end

  def calculate_age(birthday)
    (Date.today - birthday).to_i / 365
  end
end
