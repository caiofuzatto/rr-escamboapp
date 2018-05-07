class Category < ActiveRecord::Base
    validates :description, presence: true, length: {minimum: 4}
end
