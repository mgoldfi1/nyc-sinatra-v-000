class FiguresController < ApplicationController




  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.create(name: params[:figure][:name])
    params[:figure][:title_ids].each do |id|
      figure.titles << Title.find_by_id(id)
    end
    params[:figure][:landmark_ids].each do |id|
      figure.landmarks << Landmark.find_by_id(id)
    end
    if !params[:landmark][:name].empty? && !params[:landmark][:year].empty?
      figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year])
    end

  end

















end
