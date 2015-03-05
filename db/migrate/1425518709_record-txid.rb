Sequel.migration do
  up do
    add_column :records, :txid, :bigint, default: Sequel.function(:txid_current)
    run <<-SQL
      CREATE OR REPLACE FUNCTION update_txid_column()
        RETURNS TRIGGER AS $$
        BEGIN
           NEW.txid = txid_current();
           RETURN NEW;
        END;
        $$ language 'plpgsql';
      SQL
    run <<-SQL
      CREATE TRIGGER update_records_txid BEFORE UPDATE
        ON records FOR EACH ROW EXECUTE PROCEDURE
        update_txid_column();
      SQL
    
  end

  down do
    run <<-SQL
      DROP TRIGGER IF EXISTS update_records_txid ON records;
      DROP FUNCTION IF EXISTS update_txid_column CASCADE;
      SQL
    drop_column :records, :txid
  end
end
