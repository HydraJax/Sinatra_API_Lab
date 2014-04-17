require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'
require 'pry'

# require 'json'


# TODO: Add another get here for the poster url.  The path for the poster
# should look like this example '/poster/tt2724064'

     #Routes:
 #get is a request with relative url and a block to execute
    # get '/' do

get '/' do
html_str = '<html>
<h1>Movie Search!</h1>
<body>Enter a movie title here: </body>


<form action="/results" method="get"> 

action routs us to the

<input type="search" name="movie">

<input type="submit">
</form>
</html>'
end

# browser makes a request GET with action rRESULTS

get '/results' do

search = {params[:movie]}

response = Typhoeus.get("http://www.omdbapi.com/"?=#{search})

answer = JSON.parse(response.body)
movie_arr = answer["Search"]
str = ""
movie_arr.each do |movie|  
str +=	"<a><p>#{movie["Title"]}  #{movie["Year"]}</p></a>"
end

# str += "<br><a href=poster/#{movie["imdbID"]}> #{movie["Title"]} - #{movie["Year"]} </a><br>"
#   end
str

 end