#TAGS

#========
#Index
#========

get '/tags' do
  @tags = Tag.all
  erb :'tags/index'
end

#New
get '/tags/new' do
  erb :'tags/new'
end

#Show

get '/tags/:id' do
  @tag = Tag.find(params[:id])
  erb :'tags/show'
end


#Create
post '/tags' do
  tag = tag.new(params)
  if tag.save
    redirect "/tags/#{tag.id}"
  else
    redirect "/tags/new"
  end
end



# Put
put '/tags/:id' do
  tag = tag.find(params[:id])
  if tag.update(params[:tag])
    redirect "/tags/#{tag.id}"
  else
    redirect "/tags/#{tag.id}/edit"
  end
end

#Delete
delete '/tags/:id' do
  tag = tag.find(params[:id])
  if tag.destroy
    redirect '/tags'
  else
    redirect "/tags/#{tag.id}"
  end
end
