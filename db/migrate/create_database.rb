class CreateDatabase < ActiveRecord::Migration
  def self.up
    # insert schema.rb here
    ActiveRecord::Schema.define(version: 20171205203537) do

      create_table "athletes", primary_key: "athlete_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.string "athlete_name", limit: 45
        t.string "gender", limit: 1
        t.integer "class_year"
        t.integer "sports_id"
        t.integer "team_id"
        t.string "position", limit: 50
        t.index ["sports_id"], name: "sports_id_idx"
      end

      create_table "schedules", primary_key: ["schedule_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.timestamp "schedule_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
        t.integer "location_id"
        t.string "schedule_type", limit: 50
        t.integer "score"
        t.integer "team_id", null: false
        t.index ["location_id"], name: "location_id"
        t.index ["team_id"], name: "schedule_team_fk"
      end

      create_table "location", primary_key: "location_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.string "location_name", limit: 20
      end

      create_table "sports", primary_key: "sports_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.string "sports_type", limit: 20
      end

      create_table "sports_athletes", primary_key: ["sports_id", "athlete_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.integer "sports_id", null: false
        t.integer "athlete_id", null: false
        t.index ["athlete_id"], name: "s_athletes_fk"
      end

      create_table "staff", primary_key: "staff_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.string "staff_name", limit: 20
        t.string "title", limit: 20
      end

      create_table "team", primary_key: "team_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.string "team_name", limit: 20
        t.integer "capacity"
        t.integer "sports_id"
        t.integer "staff_id"
        t.index ["sports_id"], name: "sports_id"
        t.index ["staff_id"], name: "staff_id"
      end

      create_table "team_athletes", primary_key: ["team_id", "athlete_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.integer "team_id", null: false
        t.integer "athlete_id", null: false
        t.index ["athlete_id"], name: "tAthlete_fk"
      end

      add_foreign_key "db_schedule", "location", primary_key: "location_id", name: "location_id", on_update: :cascade, on_delete: :cascade
      add_foreign_key "db_schedule", "team", primary_key: "team_id", name: "schedule_team_fk", on_update: :cascade, on_delete: :cascade
      add_foreign_key "sports_athletes", "athletes", primary_key: "athlete_id", name: "s_athletes_fk", on_update: :cascade, on_delete: :cascade
      add_foreign_key "sports_athletes", "sports", column: "sports_id", primary_key: "sports_id", name: "sports_a_fk", on_update: :cascade, on_delete: :cascade
      add_foreign_key "team", "sports", column: "sports_id", primary_key: "sports_id", name: "sports_id", on_update: :cascade, on_delete: :cascade
      add_foreign_key "team", "staff", primary_key: "staff_id", name: "staff_id", on_update: :cascade, on_delete: :cascade
      add_foreign_key "team_athletes", "athletes", primary_key: "athlete_id", name: "tAthlete_fk", on_update: :cascade, on_delete: :cascade
      add_foreign_key "team_athletes", "team", primary_key: "team_id", name: "teamA_fk", on_update: :cascade, on_delete: :cascade
    end
  end

#  def self.down
    # drop all the tables if you really need
    # to support migration back to version 0
#  end
end
