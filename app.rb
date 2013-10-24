require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:///foo.sqlite3"

class Task < ActiveRecord::Base
	validates_presence_of :content
end


get "/" do
	#display the list of tasks written in data.txt
	@tasks = Task.all
	erb :index
end

post "/new" do
	#add task.id to data.txt
	@task = Task.new(content: params[:fock])
	@task.save
	redirect "/"
end

get "/edit/:id" do
	#replace the content of task.id
	@task = Task.find(params[:id])
	erb :edit
end

put "/edit/:id" do
	@task = Task.find(params[:id])   
	@task.update_attributes(content: params[:fock])
	redirect "/"
end

# delete "todo/delete/:id" do
# 	#delete task.id in data.txt
# end

# get "/:id" do
#  	#display the content of task.id if it exist in data.txt
#  	@tasks = Task.find(params[:id])
#  	erb :index
# end