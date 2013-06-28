require 'pg'
require 'pry'
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?

def sql_query(sql)
  db = PG.connect(:dbname => 'address_book', :host => 'localhost')
  query_result = db.exec(sql)
  db.close
  return query_result
end

get '/' do
  sql = "select * from contacts"
  @query_result = sql_query(sql)

  erb :address_book
end

post '/new_friend' do
  sql = "insert into contacts values ('#{params[:first]}', '#{params[:last]}', '#{params[:age]}', '#{params[:gender]}', '#{params[:dtgd]}', '#{params[:phone]}')"
  sql_query(sql)

  redirect to('/')
end



