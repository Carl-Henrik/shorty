class AddJsonbColumnToVisits < ActiveRecord::Migration[5.0]
  # adding jsonb collumn for http_user_agent.
  # Can now save hashes converted to jsonb in that column
  def change
    add_column :visits, :http_user_agent, :jsonb, null: false, default: '{}'
    add_index  :visits, :http_user_agent, using: :gin
  end
end
