class Answer < ActiveRecord::Base
	belongs_to :question, counter_cache: true
	belongs_to :turk, class_name: "Turk", foreign_key:"turk_id"
end
