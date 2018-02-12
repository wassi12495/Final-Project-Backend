class CreateAddTrainerRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :add_trainer_requests do |t|
      t.integer :client_id, foreign_key: true
      t.integer :client_id, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
