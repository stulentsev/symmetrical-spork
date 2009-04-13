class StudentsController < ApplicationController
  include UsersHelper
  before_filter :get_course

  # GET /students
  # GET /students.xml
  def index
    @students = Student.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @students }
    end
  end

  # GET /students/1
  # GET /students/1.xml
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html {render :layout => 'student'}
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/new
  # GET /students/new.xml
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/1/edit
  def edit
    params[:student][:existing_contact_attributes] ||= {}
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.xml
  def create
    @student = Student.new(params[:course_students])
    @student.course = @course

    if @student.save
        user = find_or_create_user_by_login(@student.email, 4)
        @student.user = user
        UserMailer.deliver_new_password_notification(@student) if @student.user.password
        responds_to_parent do
          render :update do |page|
            page << "if (!$('language_#{@student.language.id}')) {"
              page.insert_html :bottom, 'languages', :partial => 'students/language', :object => @student.language, :locals => {:students => nil}
            page << '}'
            page.insert_html :bottom, "language_#{@student.language.id}", :partial => 'students/student', :object => @student, :locals => {:url => course_student_url(@course.id, @student.id)}
            page.replace_html 'new_student', :partial => 'students/new', :object => Student.new(:course_id => params[:course_id])
          end
        end
    else
      responds_to_parent do
        render :update do |page|
          page.replace_html 'new_student', :partial => 'students/new', :object => @student
        end
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.xml
  def update
    params[:student][:existing_contact_attributes] ||= {}
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        flash[:notice] = 'Student was successfully updated.'
        format.html { redirect_to(@student) }
        format.xml  { head :ok }
        format.json { render :json => @student }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  def professional_profile
    @student = Student.find(params[:id])

  end

  # DELETE /students/1
  # DELETE /students/1.xml
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to(students_url) }
      format.xml  { head :ok }
    end
  end

  def edit_contacts
    @student = Student.find(params[:id])
  end

  def save_contacts
    params[:student][:existing_contact_attributes] ||= {}
    @student = Student.find(params[:id])
    if !@student.update_attributes(params[:student])
      render :action => 'edit_contacts'
    end
  end

  private
  def get_course
    @course = Course.find_by_id params[:course_id]
  end
end

