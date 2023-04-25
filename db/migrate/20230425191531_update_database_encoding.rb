class UpdateDatabaseEncoding < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      SET NAMES utf8mb4;
      ALTER DATABASE `#{ActiveRecord::Base.connection.current_database}` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
    SQL
  end

  def down
    execute <<-SQL
      ALTER DATABASE `#{ActiveRecord::Base.connection.current_database}` CHARACTER SET utf8 COLLATE utf8_general_ci;
    SQL
  end
end
