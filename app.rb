require "sinatra"

def get_data
	@tasks = []
	IO.foreach('public/data.txt') do |line|
		@tasks << line
	end
end

get "/" do
	#display the list of tasks written in data.txt
	get_data
	erb :index
end

get "/:id" do
	#display the content of task.id if it exist in data.txt
end

post "/" do
	#add task.id to data.txt
	get_data
	@tasks << params[:new]
	open('public/data.txt','w') do |add|
		add.puts @tasks
	end
	redirect "/"
end

put "/edit/:id" do
	#replace the content of task.id in data.txt
end

delete "/delete/:id" do
	#delete task.id in data.txt
end