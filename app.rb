 require "sinatra"


class Todo
	def initialize
		@lines = []
		@path = 'public/data.txt'
	end

	def read
		IO.foreach(@path) do |line|
			@lines << line
		end
		return @lines
	end
	
	def save
		open(@path,'w') do |add|
			add.puts @lines
		end
	end
end

get "/" do
	#display the list of tasks written in data.txt
	@liste = Todo.new
	erb :index
end

post "/" do
	#add task.id to data.txt
	@liste = Todo.new
	@liste.read << params[:new]
	@liste.save
	redirect "/"
end

# get "/:id" do
# 	#display the content of task.id if it exist in data.txt
# end

# put "/edit/:id" do
# 	#replace the content of task.id in data.txt
# end

# delete "/delete/:id" do
# 	#delete task.id in data.txt
# end