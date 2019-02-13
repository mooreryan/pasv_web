class CreatePasvs < ActiveRecord::Migration[5.2]
  def change
    create_table :pasvs do |t|
      t.string :refs_fname
      t.string :queries_fname
      t.string :aligner
      t.integer :roi_start
      t.integer :roi_end

      t.timestamps
    end
  end
end
