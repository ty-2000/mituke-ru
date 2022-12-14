# frozen_string_literal: true

class AddIndexToPrefecture < ActiveRecord::Migration[7.0]
  def change
    add_index :prefectures, :name, unique: true
  end
end
