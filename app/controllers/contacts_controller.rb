class ContactsController < ApplicationController
  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        flash[:notice] = 'Contact was successfully created.'
        format.html { redirect_to(@contact) }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        flash[:notice] = 'Contact was successfully updated.'
        format.html { redirect_to(@contact) }
        format.xml  { head :ok }
        format.json { render :json => @contact }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(contacts_url) }
      format.xml  { head :ok }
    end
  end

  def add_new
    @contact = Contact.new( :contact_type => params[:contact_type],
                            :contact_name => params[:contact_name],
                            :student_id => params[:student_id] )
  end
end
