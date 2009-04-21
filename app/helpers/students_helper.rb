module StudentsHelper
  def schooling_ddl form
    form.select :schooling_id, Schooling.find(:all).map {|s| [s.name, s.id]}, { :include_blank => true }
  end

  def calculate_age(birthday)
    (Date.today - birthday).to_i / 365
  end

  def formatted_address stud
    "#{stud.address1} #{stud.address2} #{stud.building_no} #{stud.compl} #{stud.state} #{stud.uf} #{stud.cep}"
  end
end
