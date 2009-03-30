module ActiveRecord
  module ConnectionAdapters # :nodoc:
    module SchemaStatements
      # Returns a Hash of mappings from the abstract data types to the native
      # database types.  See TableDefinition#column for details on the recognized
      # abstract data types.
      def native_database_types
        {}
      end

      # def tables(name = nil) end

      # Returns an array of indexes for the given table.
      # def indexes(table_name, name = nil) end

      # Returns an array of Column objects for the table specified by +table_name+.
      # See the concrete implementation for details on the expected parameter values.
      def columns(table_name, name = nil) end

      # Creates a new table
      # There are two ways to work with #create_table.  You can use the block
      # form or the regular form, like this:
      #
      # === Block form
      #  # create_table() yields a TableDefinition instance
      #  create_table(:suppliers) do |t|
      #    t.column :name, :string, :limit => 60
      #    # Other fields here
      #  end
      #
      # === Regular form
      #  create_table(:suppliers)
      #  add_column(:suppliers, :name, :string, {:limit => 60})
      #
      # The +options+ hash can include the following keys:
      # [<tt>:id</tt>]
      #   Set to true or false to add/not add a primary key column
      #   automatically.  Defaults to true.
      # [<tt>:primary_key</tt>]
      #   The name of the primary key, if one is to be added automatically.
      #   Defaults to +id+.
      # [<tt>:options</tt>]
      #   Any extra options you want appended to the table definition.
      # [<tt>:temporary</tt>]
      #   Make a temporary table.
      # [<tt>:force</tt>]
      #   Set to true or false to drop the table before creating it.
      #   Defaults to false.
      #
      # ===== Examples
      # ====== Add a backend specific option to the generated SQL (MySQL)
      #  create_table(:suppliers, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8')
      # generates:
      #  CREATE TABLE suppliers (
      #    id int(11) DEFAULT NULL auto_increment PRIMARY KEY
      #  ) ENGINE=InnoDB DEFAULT CHARSET=utf8
      #
      # ====== Rename the primary key column
      #  create_table(:objects, :primary_key => 'guid') do |t|
      #    t.column :name, :string, :limit => 80
      #  end
      # generates:
      #  CREATE TABLE objects (
      #    guid int(11) DEFAULT NULL auto_increment PRIMARY KEY,
      #    name varchar(80)
      #  )
      #
      # ====== Do not add a primary key column
      #  create_table(:categories_suppliers, :id => false) do |t|
      #    t.column :category_id, :integer
      #    t.column :supplier_id, :integer
      #  end
      # generates:
      #  CREATE TABLE categories_suppliers_join (
      #    category_id int,
      #    supplier_id int
      #  )
      #
      # See also TableDefinition#column for details on how to create columns.
      def create_table(name, options = {})
        table_definition = TableDefinition.new(self)
        table_definition.primary_key(options[:primary_key] || "id") unless options[:id] == false

        yield table_definition

        if options[:force]
          drop_table(name) rescue nil
        end

        create_sql = "CREATE#{' TEMPORARY' if options[:temporary]} TABLE "
        create_sql << "#{name} ("
        create_sql << table_definition.to_sql
        create_sql << ") #{options[:options]}"
        execute create_sql
      end
      
      # Renames a table.
      # ===== Example
      #  rename_table('octopuses', 'octopi')
      def rename_table(name, new_name)
        raise NotImplementedError, "rename_table is not implemented"
      end

      # Drops a table from the database.
      def drop_table(name)
        execute "DROP TABLE #{name}"
      end

      # Adds a new column to the named table.
      # See TableDefinition#column for details of the options you can use.
      def add_column(table_name, column_name, type, options = {})
        add_column_sql = "ALTER TABLE #{table_name} ADD #{column_name} #{type_to_sql(type, options[:limit])}"
        add_column_options!(add_column_sql, options)
        execute(add_column_sql)
      end

      # Removes the column from the table definition.
      # ===== Examples
      #  remove_column(:suppliers, :qualification)
      def remove_column(table_name, column_name)
        execute "ALTER TABLE #{table_name} DROP #{column_name}"
      end

      # Changes the column's definition according to the new options.
      # See TableDefinition#column for details of the options you can use.
      # ===== Examples
      #  change_column(:suppliers, :name, :string, :limit => 80)
      #  change_column(:accounts, :description, :text)
      def change_column(table_name, column_name, type, options = {})
        raise NotImplementedError, "change_column is not implemented"
      end

      # Sets a new default value for a column.  If you want to set the default
      # value to +NULL+, you are out of luck.  You need to
      # DatabaseStatements#execute the apppropriate SQL statement yourself.
      # ===== Examples
      #  change_column_default(:suppliers, :qualification, 'new')
      #  change_column_default(:accounts, :authorized, 1)
      def change_column_default(table_name, column_name, default)
        raise NotImplementedError, "change_column_default is not implemented"
      end

      # Renames a column.
      # ===== Example
      #  rename_column(:suppliers, :description, :name)
      def rename_column(table_name, column_name, new_column_name)
        raise NotImplementedError, "rename_column is not implemented"
      end

      # Adds a new index to the table.  +column_name+ can be a single Symbol, or
      # an Array of Symbols.
      #
      # The index will be named after the table and the first column names,
      # unless you pass +:name+ as an option.
      #
      # ===== Examples
      # ====== Creating a simple index
      #  add_index(:suppliers, :name)
      # generates
      #  CREATE INDEX suppliers_name_index ON suppliers(name)
      # ====== Creating a unique index
      #  add_index(:accounts, [:branch_id, :party_id], :unique => true)
      # generates
      #  CREATE UNIQUE INDEX accounts_branch_id_index ON accounts(branch_id, party_id)
      # ====== Creating a named index
      #  add_index(:accounts, [:branch_id, :party_id], :unique => true, :name => 'by_branch_party')
      # generates
      #  CREATE UNIQUE INDEX by_branch_party ON accounts(branch_id, party_id)
      def add_index(table_name, column_name, options = {})
        index_name = "#{table_name}_#{Array(column_name).first}_index"

        if Hash === options # legacy support, since this param was a string
          index_type = options[:unique] ? "UNIQUE" : ""
          index_name = options[:name] || index_name
        else
          index_type = options
        end

        execute "CREATE #{index_type} INDEX #{index_name} ON #{table_name} (#{Array(column_name).join(", ")})"
      end

      # Remove the given index from the table.
      #
      # Remove the suppliers_name_index in the suppliers table (legacy support, use the second or third forms).
      #   remove_index :suppliers, :name
      # Remove the index named accounts_branch_id in the accounts table.
      #   remove_index :accounts, :column => :branch_id
      # Remove the index named by_branch_party in the accounts table.
      #   remove_index :accounts, :name => :by_branch_party
      
      def remove_index(table_name, options = {})
        execute "DROP INDEX #{index_name(table_name, options)} ON #{table_name}"
      end

      def index_name(table_name, options) #:nodoc:
        if Hash === options # legacy support
          if options[:column]
            "#{table_name}_#{options[:column]}_index"
          elsif options[:name]
            options[:name]
          else
            raise ArgumentError, "You must specify the index name"
          end
        else
          "#{table_name}_#{options}_index"
        end
      end

      # Returns a string of <tt>CREATE TABLE</tt> SQL statement(s) for recreating the
      # entire structure of the database.
      def structure_dump
      end

      # Should not be called normally, but this operation is non-destructive.
      # The migrations module handles this automatically.
      def initialize_schema_information
        begin
          execute "CREATE TABLE #{ActiveRecord::Migrator.schema_info_table_name} (version #{type_to_sql(:integer)})"
          execute "INSERT INTO #{ActiveRecord::Migrator.schema_info_table_name} (version) VALUES(0)"
        rescue ActiveRecord::StatementInvalid
          # Schema has been intialized
        end
      end

      def dump_schema_information #:nodoc:
        begin
          if (current_schema = ActiveRecord::Migrator.current_version) > 0
            return "INSERT INTO #{ActiveRecord::Migrator.schema_info_table_name} (version) VALUES (#{current_schema})" 
          end
        rescue ActiveRecord::StatementInvalid 
          # No Schema Info
        end
      end


      def type_to_sql(type, limit = nil) #:nodoc:
        native = native_database_types[type]
        limit ||= native[:limit]
        column_type_sql = native[:name]
        column_type_sql << "(#{limit})" if limit
        column_type_sql
      end            
    
      def add_column_options!(sql, options) #:nodoc:
        sql << " DEFAULT #{quote(options[:default], options[:column])}" unless options[:default].nil?
        sql << " NOT NULL" if options[:null] == false
      end
    end
  end
end
