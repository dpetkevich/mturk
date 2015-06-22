class AddQuestionAttributes < ActiveRecord::Migration
  def change
  	add_column :questions, :photo_id, :integer	
  	add_column :questions, :answers_count, :integer
  	Question.all.each do |question|
    	Question.reset_counters(question.id, :upvotes)
	end
  end
end
