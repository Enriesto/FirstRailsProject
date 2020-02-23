# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'books/index'
  # get 'books/show'
  root to: 'books#index'

  get 'books/:id', to: 'books#show', id: /\d+/, as: 'book' # book_path
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
