class StudentPerformancesController < ApplicationController
  # GET /student_performances
  # GET /student_performances.xml
  def index
    @student_performances = StudentPerformance.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_performances }
    end
  end

  # GET /student_performances/1
  # GET /student_performances/1.xml
  def show
    @student_performance = StudentPerformance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_performance }
    end
  end

  # GET /student_performances/new
  # GET /student_performances/new.xml
  def new
    @student_performance = StudentPerformance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_performance }
    end
  end

  # GET /student_performances/1/edit
  def edit
    @student_performance = StudentPerformance.find(params[:id])
  end

  # POST /student_performances
  # POST /student_performances.xml
  def create
    @student_performance = StudentPerformance.new(params[:student_performance])

    respond_to do |format|
      if @student_performance.save
        flash[:notice] = 'StudentPerformance was successfully created.'
        format.html { redirect_to(@student_performance) }
        format.xml  { render :xml => @student_performance, :status => :created, :location => @student_performance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_performance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_performances/1
  # PUT /student_performances/1.xml
  def update
    @student_performance = StudentPerformance.find(params[:id])

    respond_to do |format|
      if @student_performance.update_attributes(params[:student_performance])
        flash[:notice] = 'StudentPerformance was successfully updated.'
        format.html { redirect_to(@student_performance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_performance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_performances/1
  # DELETE /student_performances/1.xml
  def destroy
    @student_performance = StudentPerformance.find(params[:id])
    @student_performance.destroy

    respond_to do |format|
      format.html { redirect_to(student_performances_url) }
      format.xml  { head :ok }
    end
  end
end
