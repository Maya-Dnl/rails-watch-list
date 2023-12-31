class BookmarksController < ApplicationController

  before_action :set_params, only: %i[new create]

  def new
    # @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Bookmark was successfully created.'
  end

  private

  def set_params
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

end
