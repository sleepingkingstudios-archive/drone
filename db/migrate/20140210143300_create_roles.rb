class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :company
      t.string :title
      t.string :url
      t.date :date_submitted
      t.text :notes
      t.integer
    end

    add_reference :roles, :recruiter
  end
end
