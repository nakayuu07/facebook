class AddReadToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :read, :boolean, default: false
  end
end
