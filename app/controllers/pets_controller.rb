class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
  
    @pet = Pet.create(name: params[:pet_name], owner_id: params[:owner][:id])

    if !params[:owner].empty? && params[:owner][:name] != ""
      @owner = Owner.create(name: params[:owner][:name])
      @owner.pets << @pet
    end
    # binding.pry
    # @pet.owner.name = @owner.name

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end

  patch '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
end