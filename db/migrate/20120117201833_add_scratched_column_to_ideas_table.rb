class AddScratchedColumnToIdeasTable < ActiveRecord::Migration
  def change
    add_column :ideas, :scratched, :boolean, :default => false
  end
end
