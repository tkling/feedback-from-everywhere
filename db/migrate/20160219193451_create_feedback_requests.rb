class CreateFeedbackRequests < ActiveRecord::Migration
  def change
    create_table :feedback_requests do |t|
      t.string :name
      t.string :email
      t.string :manager_email
      t.string :feedback_id

      t.timestamps null: false
    end
  end
end
