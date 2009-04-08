module ContactsHelper
  def add_new_contact_link contact_type
    target_element = "contacts_#{contact_type}_list"
    name = contact_type == 'telephone' ? 'Outro' : nil

    link_to_remote image_tag('plus_symbol.png', :style => "width: 32px; height: 32px"),
                   :url => url_for(:controller => 'contacts',
                           :action => 'add_new',
                           :contact_type => contact_type,
                           :contact_name => name,
                           :student_id => @student.id,
                           :target_element => target_element)
  end

  def render_contacts type, read_only = false
    @student.contacts.select{|c| c.contact_type == type}.
            map {|c| render :partial => 'contacts/contact_row',
                            :locals => {:contact => c,
                                        :type => type,
                                        :read_only => read_only}}.
            join
  end

  def render_ro_contacts type
    render_contacts type, true
  end
end
