class RemoveHttpUserAgentFromVisits < ActiveRecord::Migration[5.0]
  def change
    remove_column :visits, :http_user_agent, :string
  end
end
