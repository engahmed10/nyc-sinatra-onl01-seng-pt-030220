class LandmarksController < ApplicationController
  # add controller methods


  get '/landmarks'  do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new'  do

      erb :'/landmarks/new' 
  end

  post '/landmarks'  do
   # binding.pry
    @landmark=Landmark.create(params[:landmark])
    redirect to "landmarks/#{@landmark.id}"
  end

  get "/landmarks/:id/edit"   do
    @landmark=Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end


  patch "/landmarks/:id"  do

    @landmark=Landmark.find(params[:id])
    @landmark.update(year_completed:params["landmark"]["year_completed"],name:params["landmark"]["name"])

    redirect to "/landmarks/#{@landmark.id}"

  end

  get '/landmarks/:id'  do
     @landmark=Landmark.find(params[:id])
     erb :'landmarks/show'
  end


end
