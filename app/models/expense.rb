class Expense < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_one_attached :doc, dependent: :destroy
end
