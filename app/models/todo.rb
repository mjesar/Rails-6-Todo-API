class Todo < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 2, maximum: 50 }
  validates :status, inclusion: { in: [true, false] }
end
