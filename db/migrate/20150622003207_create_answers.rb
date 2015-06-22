class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.timestamps null: false
      t.belongs_to :question
      t.string :content
      t.belongs_to :turk

    end
  end
end

