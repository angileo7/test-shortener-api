class Url < ApplicationRecord
    scope :more_visited, -> { order('visit_count DESC').take(100) }
end
