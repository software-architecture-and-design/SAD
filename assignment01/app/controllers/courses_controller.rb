class CoursesController < ApplicationController
  # before_action :set_course, only: [:show, :edit, :update, :destroy, :change_state]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all.order(:id)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new

    # ------ fetch all user ------
    @allUser = User.all

    # ------ create array for collected only instructors -------
    @listOfInstructor = Array.new

    # ------ put name of each instructors in to array of instructors --------
    @instructorUser = @allUser.each do |instructorUsers|
      if instructorUsers.role.name == "instructor"
        @listOfInstructor.push(instructorUsers.firstname)
      end
    end
  end

  # GET /courses/1/edit
  def edit
    # ------ fetch all user ------
    @allUser = User.all

    # ------ create array for collected only instructors -------
    @listOfInstructor = Array.new

    # ------ put name of each instructors in to array of instructors --------
    @instructorUser = @allUser.each do |instructorUsers|
      if instructorUsers.role.name == "instructor"
        @listOfInstructor.push(instructorUsers.firstname)
      end
    end
  end

  # POST /courses
  # POST /courses.json
  def create
    # @course = Course.new(course_params)

    CourseBuilder.build do |builder|
      builder.set_code(course_params['code'])
      builder.set_title(course_params['title'])
      builder.set_instructor(course_params['instructor'])
      builder.set_semester(course_params['semester'])
      builder.set_credit(course_params['credit'])
      builder.set_room(course_params['room'])
      builder.set_evaluation(course_params['midterm'], course_params['final'], course_params['assignment'], course_params['project'])

      @course = builder.course
    end

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_url, notice: 'Course was successfully created.' }
        format.json { render :index, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_state
    # my_course = Course.find(params[:my_id])
    @course.change_state

    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully changed type.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:code, :title, :instructor, :semester, :credit, :room, :midterm, :final, :assignment, :project)
    end
end
