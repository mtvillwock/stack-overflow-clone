class AddVoteToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :vote, :integer, default: 0
  end
end
