class RemoveUsersIdFromMovies < ActiveRecord::Migration[5.2]
  def up
    remove_column :movies, :users_id, foreign_key: true
  end
end
