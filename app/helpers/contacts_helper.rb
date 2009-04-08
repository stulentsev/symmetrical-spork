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

  def render_contacts type
    @student.contacts.select{|c| c.contact_type == type}.
            map {|c| render :partial => 'contacts/contact_row',
                            :locals => {:contact => c,
                                        :type => type}}.
            join
  end
end
