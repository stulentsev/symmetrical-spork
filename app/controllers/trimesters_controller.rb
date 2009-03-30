class TrimestersController < ApplicationController
  # GET /trimesters
  # GET /trimesters.xml
  def index
    @trimesters = Trimester.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trimesters }
    end
  end

  # GET /trimesters/1
  # GET /trimesters/1.xml
  def show
    @trimester = Trimester.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trimester }
    end
  end

  # GET /trimesters/new
  # GET /trimesters/new.xml
  def new
    @trimester = Trimester.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trimester }
    end
  end

  # GET /trimesters/1/edit
  def edit
    @trimester = Trimester.find(params[:id])
  end

  # POST /trimesters
  # POST /trimesters.xml
  def create
    @trimester = Trimester.new(params[:trimester])

    respond_to do |format|
      if @trimester.save
        flash[:notice] = 'Trimester was successfully created.'
        format.html { redirect_to(@trimester) }
        format.xml  { render :xml => @trimester, :status => :created, :location => @trimester }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trimester.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trimesters/1
  # PUT /trimesters/1.xml
  def update
    @trimester = Trimester.find(params[:id])

    respond_to do |format|
      if @trimester.update_attributes(params[:trimester])
        flash[:notice] = 'Trimester was successfully updated.'
        format.html { redirect_to(@trimester) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trimester.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trimesters/1
  # DELETE /trimesters/1.xml
  def destroy
    @trimester = Trimester.find(params[:id])
    @trimester.destroy

    respond_to do |format|
      format.html { redirect_to(trimesters_url) }
      format.xml  { head :ok }
    end
  end
end
