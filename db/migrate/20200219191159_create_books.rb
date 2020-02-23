# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      # t.string :author
      t.string :booktitle
      t.integer :pages
      t.decimal :avgrating

      t.timestamps
    end
  end
end
