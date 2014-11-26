class CreateStoryPolicies < ActiveRecord::Migration
  def change
    create_table :story_policies do |t|

      t.timestamps
    end
  end
end
