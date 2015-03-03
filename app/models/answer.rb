class Answer < ActiveRecord::Base
  belongs_to :question
  validates :username, :body, presence: true

  default_scope { order(vote: :desc) }
end
