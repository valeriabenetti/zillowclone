class HomesController < ApplicationController
  before_action :authorize!, except: [:index, :show]

  # GET /homes
  def index
    @homes = Home.all
  end

  # GET /homes/1
  def show
    @home = Home.find(params[:id])
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
    @home = Home.find(params[:id])

    if @home.user != current_user
      redirect_to homes_path
    end
  end

  # POST /homes
  def create
    @home = Home.new(home_params)
    @home.user = current_user

    if @home.save
      redirect_to @home, notice: 'Home was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /homes/1
  def update
    @home = Home.find(params[:id])
    if @home.user != current_user
      redirect_to homes_path
      return
    end
    if @home.update(home_params)
      redirect_to @home, notice: 'Home was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /homes/1
  def destroy
    @home = Home.find(params[:id])
    if @home.user != current_user
      redirect_to homes_path
      return
    end
    @home.destroy
    redirect_to homes_url, notice: 'Home was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def home_params
    params.require(:home).permit(:address, :city, :state, :zipcode, :bedrooms, :bathrooms, :square_feet, :price, :description)
  end
end
