class StudentReport < ActiveRecord::Base

  def before_update
    self.s1_difficulties = @difficulties.to_yaml
  end

  def difficulties
    @difficulties ||= YAML::load(self.s1_difficulties || "")
    @difficulties ||= []
  end
  def add_difficulty diff
    @difficulties ||= []
    @difficulties << diff
  end

  def language_techniques
    difficulties.member?('language_techniques')
  end
  def language_techniques=(parm)
    add_difficulty 'language_techniques' if parm.to_i == 1
  end

  def equipment
    difficulties.member?('equipment')
  end
  def equipment=(parm)
    add_difficulty 'equipment' if parm.to_i == 1
  end

  def school_didactics
    difficulties.member?('school_didactics')
  end
  def school_didactics=(parm)
    add_difficulty 'school_didactics' if parm.to_i == 1
  end

  def relationships_with_professors
    difficulties.member?('relationships_with_professors')
  end
  def relationships_with_professors=(parm)
    add_difficulty 'relationships_with_professors' if parm.to_i == 1
  end

  def relationships_with_students
    difficulties.member?('relationships_with_students')
  end
  def relationships_with_students=(parm)
    add_difficulty 'relationships_with_students' if parm.to_i == 1
  end

end
