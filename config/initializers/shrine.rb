require "shrine/storage/sql"
require "sequel"

DB = Sequel.connect(ActiveRecord::Base.connection_config)

Shrine.storages = {
  cache: Shrine::Storage::Sql.new(database: DB, table: :files),
  store: Shrine::Storage::Sql.new(database: DB, table: :files)
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :download_endpoint, storages: [:store], prefix: "attachments"
