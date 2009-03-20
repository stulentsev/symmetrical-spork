class PartnersController < ApplicationController
  def index
    @partner = Partner.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partner }
    end
  end

  def show
    @partner = Partner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partner }
    end
  end

  def new
    @partner = Partner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partner }
    end
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def create
    @partner = Partner.new(params[:partner])
    @partner.save
  end

  def update
    @partner = Partner.find(params[:id])

    respond_to do |format|
      if @partner.update_attributes(params[:partner])
        flash[:notice] = 'Partner was successfully updated.'
        format.html { redirect_to(@partner) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partner.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
  end
end
