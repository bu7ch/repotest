require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:///foo.sqlite3"

############################################## MODEL

# Define our Task model
class Task < ActiveRecord::Base
	validates_presence_of :content
end

########################################## CONTROLER

not_found do
	# Handle 404 errors
	"<h1>You're lost in the 404 area!</h1><br><a href='/'>Get back on track</a>"
end

get "/" do
	# Display all Tasks
	@tasks = Task.all
	erb :index
end

post "/new" do
	# Creat a new Task
	@task = Task.new content: params[:fock]
	@task.save
	redirect "/"
end

get "/edit/:id" do
	# Display Task.content in a form field
	@task = Task.find params[:id]
	erb :edit
end

put "/edit/:id" do
	# Update Task.content
	@task = Task.find params[:id]
	@task.update_attributes content: params[:fock]
	redirect "/"
end

delete "/delete/:id" do
	# Delete the Task entry

	# Task.delete or Task.destroy ???
	# http://www.nickpeters.net/2007/12/21/delete-vs-destroy/
end

# Todo :
# => Quand je clique sur le bouton 'trash', supprimer la tache
# => 