class PartnersController < ApplicationController
  # GET /partners
  # GET /partners.xml
  def index
    @partners = Partners.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partners }
    end
  end

  # GET /partners/1
  # GET /partners/1.xml
  def show
    @partners = Partners.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partners }
    end
  end

  # GET /partners/new
  # GET /partners/new.xml
  def new
    @partners = Partners.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partners }
    end
  end

  # GET /partners/1/edit
  def edit
    @partners = Partners.find(params[:id])
  end

  # POST /partners
  # POST /partners.xml
  def create
    @partners = Partners.new(params[:partners])

    respond_to do |format|
      if @partners.save
        flash[:notice] = 'Partners was successfully created.'
        format.html { redirect_to(@partners) }
        format.xml  { render :xml => @partners, :status => :created, :location => @partners }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partners.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partners/1
  # PUT /partners/1.xml
  def update
    @partners = Partners.find(params[:id])

    respond_to do |format|
      if @partners.update_attributes(params[:partners])
        flash[:notice] = 'Partners was successfully updated.'
        format.html { redirect_to(@partners) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partners.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.xml
  def destroy
    @partners = Partners.find(params[:id])
    @partners.destroy

    respond_to do |format|
      format.html { redirect_to(partners_url) }
      format.xml  { head :ok }
    end
  end
end
