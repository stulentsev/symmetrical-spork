class Student < ActiveRecord::Base
  belongs_to  :language
  belongs_to  :schooling
  belongs_to  :user
  belongs_to  :course
  has_one     :current_job, :class_name => 'JobRecord', :conditions => {:is_current => 1}
  has_many    :past_jobs, :class_name => 'JobRecord', :conditions => {:is_current => 0}
  has_many    :job_records
  has_many    :contacts

  has_attached_file :photo, :styles => { :thumb => "78x78#", :profile => "117x117#" }

  validates_presence_of :name, :email, :language_id
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  #validates_associated :contacts

  after_update :save_contacts

  def after_create
    # pre-create some common contact types
    self.contacts << Contact.create(:contact_type => 'telephone', :contact_name => 'Residencial')
    self.contacts << Contact.create(:contact_type => 'telephone', :contact_name => 'Celular')
    self.contacts << Contact.create(:contact_type => 'telephone', :contact_name => 'Trabalho')
    self.contacts << Contact.create(:contact_type => 'telephone', :contact_name => 'Outro')
    self.save
  end

  def new_contact_attributes= contact_attributes
    contact_attributes.each do |attrs|
      contacts.build(attrs)
    end
  end

  def existing_contact_attributes= contact_attributes
    contacts.reject(&:new_record?).each do |contact|
      attributes = contact_attributes[contact.id.to_s]
      if attributes
        contact.attributes = attributes
      else
        contacts.delete(contact)
      end
    end
  end

  def save_contacts
    contacts.each do |contact|
      contact.save
    end
  end
end
