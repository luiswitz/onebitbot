class RemoveLinks < ActiveRecord::Migration[5.1]
  def change
    drop_table(:links)
    drop_table(:link_hashtags)
  end
end
