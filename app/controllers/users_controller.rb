class UsersController < ApplicationController
  def create
    user = User.new(
        name: params[:name],
        access_key: SecureRandom.base58(16),
        position_logs: []
    )
    if user.save
      render json: {
          status: "OK",
          id: user.id,
          access_key: user.access_key
      }
    else
      render json: {status: "ERROR"}
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user && params[:access_key] == user.access_key
      if user.update_attributes(name: params[:name])
        render json: {status: "OK"}
      else
        render json: {status: "ERROR"}
      end
    else
      render json: {status: "ERROR"}
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user && params[:access_key] == user.access_key
      render json: {
          id: user.id,
          name: user.name,
          level: user.level,
          gold: user.gold,
          exp: user.exp,
          access_key: user.access_key,
          position_logs: user.position_logs
      }
    else
      render json: {status: "ERROR"}
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user && params[:access_key] == user.access_key
      if user.destroy
        render json: {status: "OK"}
      else
        render json: {status: "ERROR"}
      end
    else
      render json: {status: "ERROR"}
    end
  end
end
