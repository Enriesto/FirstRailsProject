# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  # GET /books/:id (May need to change :id to something else)
  def show
    @book = Book.find(params[:id])
  end
end
