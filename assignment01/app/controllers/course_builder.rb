class CourseBuilder
    def self.build
      builder = new
      yield(builder)
      builder.course
    end
  
    def initialize
      @course = Course.new
    end
  
    def set_code(code)
      @course.code = code
    end
  
    def set_title(title)
        @course.title = title
        
    end
  
    def set_instructor(instructor)
        if instructor != ""
            @course.instructor = instructor
        else
            @course.instructor = 'To be announce'
        end
    end
  
    def set_semester(semester)
        if semester != ""
            @course.semester = semester
        else
            @course.semester = '-'
        end
    end
  
    def set_credit(credit)
        if credit != ""
            @course.credit = credit
        else
            @course.credit = 0
        end
    end
  
    def set_room(room)
        if room != ""
            @course.room = room
        else
            @course.room = 'To be announce'
        end
    end

    def set_evaluation(midterm, final, assignment, project)
        @course.midterm = midterm
        @course.final = final
        @course.assignment = assignment
        @course.project = project
    end
  
    def course
      @course
    end
  end