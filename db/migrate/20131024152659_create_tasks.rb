class CreateTasks < ActiveRecord::Migration
  def change
  	create_table :tasks do |t|
  		t.string :content
  		t.date   :date_done
  		#t.bolean :open
  	end
  end
end
