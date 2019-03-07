class Course < ApplicationRecord

    validates_presence_of :code
    validates_presence_of :title
    validates_presence_of :credit

    validates_uniqueness_of :code

    include AASM

    aasm do
        state :require, initial: true
        state :elective

        event :require do
            transitions from: [:elective], to: :require
        end
      
        event :elective do
            transitions from: [:require], to: :elective
        end
    end

    def change_state
        if self.require?
            self.elective!
        else
            self.require!
        end

    end

end
