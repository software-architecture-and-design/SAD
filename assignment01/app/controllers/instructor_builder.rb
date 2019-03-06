class InstructorBuilder
    def self.build
      builder = new
      yield(builder)
      builder.instructor
    end
  
    def initialize
      @instructor = Instructor.new
    end
  
    def set_name(title, first_name, last_name)
      @instructor.title = title
      @instructor.first_name = first_name
      @instructor.last_name = last_name
    end
  
    def set_email(email)
        @instructor.email = email
        
    end
  
    def set_phone_number(phone_number)
        if phone_number != ""
            @instructor.phone_number = phone_number
        else
            @instructor.phone_number = '-'
        end
    end
  
    def set_office_room(office_room)
        if office_room != ""
            @instructor.office_room = office_room
        else
            @instructor.office_room = '-'
        end
    end
  
    def set_department(department)
        if department != ""
            @instructor.department = department
        else
            @instructor.department = '-'
        end
    end
  
    def set_school(school)
        if school != ""
            @instructor.school = school
        else
            @instructor.school = '-'
        end
    end

  
    def instructor
      @instructor
    end
  end