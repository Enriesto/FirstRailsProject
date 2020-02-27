# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.order(:booktitle).page params[:page]
  end

  # GET /books/:id (May need to change :id to something else)
  def show
    @book = Book.find(params[:id])
  end

  # Search action
  def search
    @books = Book.where('booktitle LIKE ?', "%#{params[:booktitle]}%").page params[:page]
  end
end
