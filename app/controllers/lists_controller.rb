class ListsController < ApplicationController
  before_action :set_params, only: %i[show]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # @list = List.find(params[:id])
  end

  private

  def set_params
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
