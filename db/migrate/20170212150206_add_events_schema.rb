class AddEventsSchema < ActiveRecord::Migration[5.0]
  def up
    execute('CREATE SCHEMA events')
  end

  def down
    execute('DROP SCHEMA events')
  end
end
