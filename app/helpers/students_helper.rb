module StudentsHelper
  def schooling_ddl form
    form.select :schooling_id, Schooling.find(:all).map {|s| [s.name, s.id]}, { :include_blank => true }
  end
end
