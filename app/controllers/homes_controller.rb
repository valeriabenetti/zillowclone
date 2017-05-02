class HomesController < ApplicationController
  before_action :authorize!, except: [:index, :show]

  # GET /homes
  def index
    if params[:query]
      @homes = Home.where('address like :pattern or city like :pattern or state like :pattern', pattern: "%#{params[:query]}%")

    else
      @homes = Home.all
    end

    @homes = @homes.page(params[:page]).per(6)
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

  def favorite
    home = Home.find(params[:id])

    Favorite.create(home: home, user: current_user)

    Rails.logger.info "FAVORITING HOME #{home.address}"
  end

  def unfavorite
    home = Home.find(params[:id])

    favorite = Favorite.find_by(home: home, user: current_user)
    favorite.destroy

    Rails.logger.info "UNFAVORITING HOME #{home.address}"
  end


  private

  # Only allow a trusted parameter "white list" through.
  def home_params
    params.require(:home).permit(:address, :city, :state, :zipcode, :bedrooms, :bathrooms, :square_feet, :price, :description, :image, :image_url)
  end
end
