require "sinatra"
require "sinatra/activerecord"


set :database, "sqlite3:///foo.sqlite3"

## MODEL

# Define our Task model
class Task < ActiveRecord::Base
	validates_presence_of :content
	def open?
		self.date_done.nil?
	end

	def today?
		self.date_done.today?
	end

	def archived?
		!open? && !today?
	end
end

## CONTROLER

not_found do
	# Handle 404 errors
	"<h1>You're lost in the 404 area!</h1><br><a href='/'>Get back on track</a>"
end

get "/" do
	# Display all Tasks
	@tasks = []
	Task.all.each do |task|
		@tasks << task if !task.archived?
	end
	erb :index
end

get "/done" do
	# Display all Tasks
	@tasks = []
	Task.all.each do |task|
		@tasks << task if task.archived?
	end
	erb :index
end

post "/new" do
	# Create a new Task
	Task.create content: params[:fock]
	redirect "/"
end

get "/edit/:id" do
	# Display Task.content in a form field
	@task = Task.find params[:id]
	erb :edit
end

put "/edit/:id" do
	# Update Task.content
	@task = Task.find(params[:id]).update_attributes content: params[:fock]
	redirect "/"
end

get "/delete/:id" do
	# Delete the Task entry
	Task.destroy params[:id]
	redirect "/"
end

get "/check/:id" do
	# Display Task.content in a form field
	Task.find(params[:id]).update_attributes date_done: Time.now
	redirect "/"
end

get "/uncheck/:id" do
	# Display Task.content in a form field
	Task.find(params[:id]).update_attributes date_done:  nil
	redirect "/"
end


# Todo :
# => 