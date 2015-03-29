class AddNewsCounterToCategories < ActiveRecord::Migration
  def change
    #remove_column :categories, :news_count, :integer, default: 0
    add_column :categories, :campnews_count, :integer, default: 0
  end
end
