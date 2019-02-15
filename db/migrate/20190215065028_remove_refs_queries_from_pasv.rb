class RemoveRefsQueriesFromPasv < ActiveRecord::Migration[5.2]
  def change
    remove_column :pasvs, :refs_fname, :string
    remove_column :pasvs, :queries_fname, :string
  end
end
