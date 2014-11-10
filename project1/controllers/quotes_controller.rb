# Quotes

#=============
# INDEX
#=============

get '/quotes' do
  @quotes= Quote.all
  erb :'quotes/index'
end

get '/quotes/new' do
  erb :'quotes/new'
end

get '/quotes/:id' do
  @quote = Quote.find(params[:id])
  @tags = Tag.all
  erb :'quotes/show'
end

get '/quotes/:id edit' do
  @quote = Quote.find(params[:id])
  @tags = Tag.all
  erb :'quotes/edit'
end

put'/quotess/:id' do
  quote = Quote.find(params[:id])
  tags = Tag.all
  quote.update(params[:quote])
  redirect "/quotes/#{quote.id}"
end

 post 'quotes/:id/add_tag' do
   quote = Quote.find(params[:id])
   tag = Tag.find(params[:tag_id])
   quote.tags.push(tag)
   redirect "/quotes/#{quote.id}"
 end

 post '/quotes/:id/remove_tag' do
   quote = Quote.find(params[:id])
   tag = Tag.find(params[:tag_id])
   quote.tags.destroy(tag)
   redirect "/quotes/#{quote.id}"
 end

 delete '/quotes/:id' do
   quote = Quote.find(params[:id])
   if quote.destroy
     redirect '/quotes'
   else
     redirect "/playlists/#{quote.id}"
   end
 end 
