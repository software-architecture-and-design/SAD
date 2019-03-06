class Instructor < ApplicationRecord
    validates_presence_of :title
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :email
    validates_uniqueness_of :email


end
