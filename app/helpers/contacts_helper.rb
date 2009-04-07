module ContactsHelper
  def add_new_contact_link contact_type
    target_element = "contacts_#{contact_type}_list"
    name = contact_type == 'telephone' ? 'Outro' : nil

    link_to_function image_tag('plus_symbol.png', :style => "width: 32px; height: 32px") do |page|
      page.insert_html :bottom, target_element,
                       :partial => 'contacts/contact_row',
                       :locals => {:contact => Contact.new( :contact_type => contact_type,
                                                            :contact_name => name,
                                                            :student_id => 4 ),
                                   :type => contact_type}
    end
  end

  def render_contacts type
    @student.contacts.select{|c| c.contact_type == type}.
            map {|c| render :partial => 'contacts/contact_row',
                            :locals => {:contact => c,
                                        :type => type}}.
            join
  end
end
