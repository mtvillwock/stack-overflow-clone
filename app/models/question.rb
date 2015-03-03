class Question < ActiveRecord::Base
  has_many :answers

  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :description, presence: true,
                          length: { minimum: 20 }

  validates :username, presence: true

  default_scope { order(vote: :desc) }
end
