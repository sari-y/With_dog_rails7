class ReviewComment < ApplicationRecord
  
  belongs_to :review
  belongs_to :use
end
