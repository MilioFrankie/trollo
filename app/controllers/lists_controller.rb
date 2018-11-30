class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @lists = @board.lists
  end

  def show
  end

  def new
    @list = @board.lists.new
  end
  
  def create
    @list = @board.lists.new(list_params)
    if @list.save
      redirect_to board_lists_path(@board)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @list.destroy
    redirect_to board_lists_path(@board)
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

  def set_board
    @board = Board.find(params[:board_id])

  end

  def set_list
    @list = List.find(params[:id])
  end

end
