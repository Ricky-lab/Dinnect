CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar NOT NULL, "email" varchar NOT NULL, "password_digest" varchar NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE TABLE IF NOT EXISTS "profiles" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar, "last_name" varchar, "class_name" varchar, "school" varchar, "major" varchar, "dietary_preference" varchar, "user_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_e424190865"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_profiles_on_user_id" ON "profiles" ("user_id");
CREATE TABLE IF NOT EXISTS "user_events" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "event_id" integer NOT NULL, "role" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_717ccf5f73"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_1b0b06bbc7"
FOREIGN KEY ("event_id")
  REFERENCES "events" ("id")
);
CREATE INDEX "index_user_events_on_user_id" ON "user_events" ("user_id");
CREATE INDEX "index_user_events_on_event_id" ON "user_events" ("event_id");
CREATE TABLE IF NOT EXISTS "events" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "description" text, "start_time" datetime(6), "duration" integer, "location_name" varchar, "location_coord" varchar, "tags" varchar, "user_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_0cb5590091"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_events_on_user_id" ON "events" ("user_id");
INSERT INTO "schema_migrations" (version) VALUES
('20231113131537'),
('20231113131523'),
('20231113131448'),
('20231030032148');

