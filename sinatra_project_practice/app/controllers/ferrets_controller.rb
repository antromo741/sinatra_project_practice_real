class FerretsController < ApplicationController

  # GET: /ferrets
  get "/ferrets" do
    @ferrets = Ferret.all
    erb :"/ferrets/index.html"
  end

  # GET: /ferrets/new
  get "/ferrets/new" do
    erb :"/ferrets/new.html"
  end

  # POST: /ferrets
  post "/ferrets" do
   # binding.pry
    ferret = Ferret.create(ferret_params)
    redirect "/ferrets/#{ferret.id}"
  end

  # GET: /ferrets/5
  get "/ferrets/:id" do
    @ferret = Ferret.find(params[:id])
    erb :"/ferrets/show.html"
    
  end

  # GET: /ferrets/5/edit
  get "/ferrets/:id/edit" do
    @ferret = Ferret.find(params[:id])
    erb :"/ferrets/edit.html"
  end

  # PATCH: /ferrets/5
  patch "/ferrets/:id" do
    @ferret = Ferret.find(params[:id])
    @ferret.update(ferret_params)
    redirect "/ferrets/#{@ferret.id}"
  end

  # DELETE: /ferrets/5/delete
  delete "/ferrets/:id" do
    @ferret = Ferret.find(params[:id])
    @ferret.destroy
    redirect "/ferrets"
  end

  private 

  def ferret_params
    allowed = ["name", "hair","short_description" ]
    params.select{|k| allowed.include?(k)}
  end


end
