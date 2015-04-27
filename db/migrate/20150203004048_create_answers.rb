class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :username
      t.text :body

      t.belongs_to :question
      t.timestamps
    end
  end
end
