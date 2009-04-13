class CoursesController < ApplicationController
  before_filter :authorize, :except => [:dashboard]

  # GET /courses
  # GET /courses.xml
  def index
    @courses = Course.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.xml
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
    @project_team_member = ProjectTeamMember.new(:course_id => @course.id)
    @activity = Activity.new(:course_id => @course.id)
    @partner = Partner.new(:course_id => @course.id)
    @marco_zero = get_user_with_reports.reports_with_deadlines.select {|r| r.report_id == 1}.first
  end

  # POST /courses
  # POST /courses.xml
  def create
    @course = Course.new(params[:course])
    profile = CourseStudentProfile.create(params[:student_profile])
    @course.student_profile = profile

    if @course.save
      redirect_to :action => 'deadlines_dashboard', :id => @course.id
    else
      render :action => 'new'
    end
  end

  # PUT /courses/1
  # PUT /courses/1.xml
  def update
    @course = Course.find(params[:id])
    @marco_zero = get_user_with_reports.reports_with_deadlines.select {|r| r.report_id == 1}.first

    if params[:commit] == 'Finalizar Relatório'
      @marco_zero.status = 2 # completed
      @marco_zero.save
      redirect_to edit_course_url(@course)
      return
    end

    respond_to do |format|
      if @course.update_attributes(params[:course]) &&
              (!params[:student_profile] ||
              @course.student_profile.update_attributes(params[:student_profile]))
        flash[:notice] = 'Course was successfully updated.'
        format.html { redirect_to(@course) }
        format.xml  { head :ok }
        format.json { render :json => @course }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(courses_url) }
      format.xml  { head :ok }
    end
  end

  def language_choice
    @course = Course.find(params[:id])
  end

  def dashboard
    @course = Course.find_by_id(params[:id])
  end

  def deadlines_dashboard
    @course = Course.find_by_id(params[:id])
    @courses = Course.find(:all,
                           :conditions => ['period_from <= ? and period_to >= ?',
                                            Date.today,
                                            Date.today])
  end
private
  def authorize
    require_user_role  [:coordinator]
  end

  def get_user_with_reports
    # TODO: replace with better permission check
    # TODO: (coordinator can access data only from its school)
    if current_user.gestor? && params[:domain_user_id]
      Coordinator.find_by_id(params[:domain_user_id]).user
    else
      current_user
    end
  end

end
