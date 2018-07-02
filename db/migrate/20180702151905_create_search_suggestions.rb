class CreateSearchSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :search_suggestions do |t|
      t.string :term
      t.integer :popularity

      t.timestamp
    end
  end
end
