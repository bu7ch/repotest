require "sinatra"

get "/" do
	#display the list of tasks written in data.txt
	@tasks = []
	IO.foreach('public/data.txt') do |line|
		@tasks << line
	end
	erb :index
end

get "/:id" do
	#display the content of task.id if it exist in data.txt
end

post "/new/:id" do
	#add task.id to data.txt
end

put "/edit/:id" do
	#replace the content of task.id in data.txt
end

delete "/delete/:id" do
	#delete task.id in data.txt
end