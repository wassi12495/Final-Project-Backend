class CreateAddClientRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :add_client_requests do |t|
      t.belongs_to :trainer, foreign_key: true
      t.belongs_to :client, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
