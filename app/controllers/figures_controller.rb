require 'pry'
class FiguresController < ApplicationController


  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/:id' do
    erb :'/figures/show'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    #  binding.pry
    figure = Figure.create(name: params[:figure][:name])
    title_ids = params[:figure][:title_ids]
    landmark_ids = params[:figure][:landmark_ids]
    if !title_ids.nil? && !title_ids.empty?
    title_ids.each do |id|
      figure.titles << Title.find_by_id(id)
    end
  end
  if !landmark_ids.nil? && !landmark_ids.empty?
    landmark_ids.each do |id|
      figure.landmarks << Landmark.find_by_id(id)
    end
  end
    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year])
    end
    if !params[:title][:name].empty?
      figure.titles << Title.create(name: params[:title][:name])
    end
    figure.save
  end

















end
