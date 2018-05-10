class Category < ActiveRecord::Base
    validates :description, presence: true, length: {minimum: 4}

    # Scopes
    scope :order_by_description, -> { order(:description) }
end
