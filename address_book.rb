# use this code to create an address book in sinatra
# create an input form
# add a person
# list people
require 'pg'
require 'pry'
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?

def sql_query(sql)
end

get '/' do
  db = PG.connect(:dbname => 'address_book', :host => 'localhost')
  sql = "select * from contacts"
  @query_result = db.exec(sql)
  db.close

  erb :address_book
end

post '/new_friend' do
  @first = params[:first]
  @last = params[:last]
  @age = params[:age]
  @gender = params[:gender]
  @dtgd = params[:dtgd]
  @phone = params[:phone]
  db = PG.connect(:dbname => 'address_book', :host => 'localhost')
  sql = "insert into contacts values ('#{@first}', '#{@last}', '#{@age}', '#{@gender}', '#{@dtgd}', '#{@phone}')"
  db.exec(sql)

  db.close
  redirect to('/')
end


# get all the inputs
# put them in the string
# make it work

# this establishes a connection to the database
 #db = PG.connect(:dbname => 'address_book',
 #  :host => 'localhost')
 #executing sql code
 #passing a string of sql to the database

 #insert into database
#db = PG.connect(:dbname => 'address_book',
#  :host => 'localhost')

#puts "what's your name girl?"
#name = gets.chomp
#sql = "insert into contacts (first) values ('#{name}')"
#db.exec(sql)
#sql = "select first, age from contacts"
#db.exec(sql) do |result|
#  result.each do |row|
#    puts row
#  end
#end
# db.close
#db.close

# reads from database
# db = PG.connect(:dbname => 'address_book',
#   :host => 'localhost')
# sql = "select first, age from contacts"
# db.exec(sql) do |result|
#   result.each do |row|
#     puts row
#   end
# end
# db.close