module LanguagesHelper
  def languages_ddl form
    form.select :language_id, Language.find(:all).map {|s| [s.name, s.id]}, { :include_blank => true }
  end

end
