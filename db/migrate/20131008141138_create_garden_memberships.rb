class CreateGardenMemberships < ActiveRecord::Migration
  def change
    create_table :garden_memberships do |t|
      t.integer :garden_id
      t.integer :user_id

      t.timestamps
    end
  end
end
