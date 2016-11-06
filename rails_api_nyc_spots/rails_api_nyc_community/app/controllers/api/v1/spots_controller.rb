class Api::V1::SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :update, :destroy]

def index
    @spots = Spot.all
    render json: @spots
  end

  def show
    render json: @spot
  end

  def create
    @spot = Spot.new(post_params)

    if @spot.save
      render json: @spot, status: :created
    else
      render json: @spot.errors, status: :unprocessable_entity
    end
  end

  def update
    if @spot.update(post_params)
      render json: @spot
    else
      render json: @spot.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @spot.destroy
  end

  private

  def set_post
    @spot ||= Spot.find(params[:id])
  end

  def post_params
    params.require(:spot)
    .permit(:location, :content, :title, :user_id)
  end
end
