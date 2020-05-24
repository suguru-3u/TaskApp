class Project < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true
  validates :responsible, presence: true
  validates :end_date, presence: true
  belongs_to :group
end
