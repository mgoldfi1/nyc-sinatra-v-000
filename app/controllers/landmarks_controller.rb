class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
  @landmark = Landmark.find_by_id(params[:id])
  erb :'/landmarks/show'
end
end
