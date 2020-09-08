class Specialist< ActiveRecord::Base
has_many :patients, through: :diagnosis 
end 