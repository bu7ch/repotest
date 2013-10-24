require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:///foo.sqlite3"

############################################## MODEL
# Define our Task model
class Task < ActiveRecord::Base
	validates_presence_of :content
end

########################################## CONTROLER
get "/" do
	# Display all Tasks
	@tasks = Task.all
	erb :index
end

post "/new" do
	# Creat a new Task
	@task = Task.new(content: params[:fock])
	@task.save
	redirect "/"
end

get "/edit/:id" do
	# Display Task.content in a form field
	@task = Task.find(params[:id])
	erb :edit
end

put "/edit/:id" do
	# Update Task.content
	@task = Task.find(params[:id])   
	@task.update_attributes(content: params[:fock])
	redirect "/"
end

delete "/delete/:id" do
	# Delete a Task entry

	# Task.delete or Task.destroy ???
	# http://www.nickpeters.net/2007/12/21/delete-vs-destroy/
end

# get "/:id" do
#  	# Display the content of task.id if it exist in the db
#  	@tasks = Task.find(params[:id])
#  	erb :index
# end