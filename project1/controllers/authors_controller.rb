#AUTHORS

#===========
# Index
#===========

# Index

get '/authors' do
  @authors = Author.all
  erb :'authors/index'
end

# Create
post '/authors' do
  author = Author.new(params[:author])
  if author.save
    redirect("/authors/#{author.id}")
  else
    redirect("/author/new")
  end
end

# New

get '/authors/new' do
  erb :'/authors/new'
end

# Show
get '/authors/:id' do
  @author = Author.find(params[:id])
  erb :'authors/show'
end

# Edit
get '/authors/:id/edit' do
  @author = Author.find(params[:id])
  if author.update(params[:author])
    redirect("/author/#{author.id}")
  else
    redirect("/author/#{author.id}/edit")
  end
end

#Delete
delete '/author/:id' do
  author = Author.find(params[:id])
  if author.destroy
    redirect('/author')
  else
    redirect("/authors/#{author.id}")
  end
end
