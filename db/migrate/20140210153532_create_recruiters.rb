class CreateRecruiters < ActiveRecord::Migration
  def change
    create_table :recruiters do |t|
      t.string :agency
      t.string :email
      t.string :name
      t.string :phone_number
    end
  end
end
