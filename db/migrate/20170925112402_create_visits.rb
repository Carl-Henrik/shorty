class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.string :remote_host
      t.string :remote_addr
      t.string :http_user_agent
      t.string :http_referer
      t.string :request_uri

      t.timestamps
    end
  end
end
