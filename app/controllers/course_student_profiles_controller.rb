class CourseStudentProfilesController < ApplicationController
  # GET /course_student_profiles
  # GET /course_student_profiles.xml
  def index
    @course_student_profiles = CourseStudentProfile.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_student_profiles }
    end
  end

  # GET /course_student_profiles/1
  # GET /course_student_profiles/1.xml
  def show
    @course_student_profile = CourseStudentProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_student_profile }
    end
  end

  # GET /course_student_profiles/new
  # GET /course_student_profiles/new.xml
  def new
    @course_student_profile = CourseStudentProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_student_profile }
    end
  end

  # GET /course_student_profiles/1/edit
  def edit
    @course_student_profile = CourseStudentProfile.find(params[:id])
  end

  # POST /course_student_profiles
  # POST /course_student_profiles.xml
  def create
    @course_student_profile = CourseStudentProfile.new(params[:course_student_profile])

    respond_to do |format|
      if @course_student_profile.save
        flash[:notice] = 'CourseStudentProfile was successfully created.'
        format.html { redirect_to(@course_student_profile) }
        format.xml  { render :xml => @course_student_profile, :status => :created, :location => @course_student_profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_student_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /course_student_profiles/1
  # PUT /course_student_profiles/1.xml
  def update
    @course_student_profile = CourseStudentProfile.find(params[:id])

    respond_to do |format|
      if @course_student_profile.update_attributes(params[:course_student_profile])
        flash[:notice] = 'CourseStudentProfile was successfully updated.'
        format.html { redirect_to(@course_student_profile) }
        format.xml  { head :ok }
        format.json {render :json => @course_student_profile}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_student_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /course_student_profiles/1
  # DELETE /course_student_profiles/1.xml
  def destroy
    @course_student_profile = CourseStudentProfile.find(params[:id])
    @course_student_profile.destroy

    respond_to do |format|
      format.html { redirect_to(course_student_profiles_url) }
      format.xml  { head :ok }
    end
  end
end
