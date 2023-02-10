class CowsController < ApplicationController
  def index 
    @cows = Cow.all.map { |cow| cow.full_data}
    
    render json: @cows
  end

  def create
    @cow = Cow.new(cows_params)

    if @cow.valid?
      @cow.save
      render json: @cow.full_data, status: :created 
    else
      render json: @cow.errors, status: :unprocessable_entity 
    end
  end

  def update
    @cow = Cow.find_by(id: params[:id])

    if @cow.nil?
      return render json: {"message" => "Cow with id #{params[:id]} not found"}, status: :not_found
    end

    if @cow.update(cows_params)
      render json: @cow.full_data, status: :ok
    else
      render json: @cow.errors, status: :unprocessable_entity 
    end
  end


  private
  def cows_params
      params.require(:cow).permit(
        :collarId,
        :cowNumber
      )
  end
end
