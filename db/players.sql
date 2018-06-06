CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name text NOT NULL,
  jersey_number int NOT NULL,
  throws text NOT NULL,
  bats text NOT NULL,
  team_players int DEFAULT 0,
  game_mvps int DEFAULT 0,
  cy_youngs int DEFAULT 0,
  silver_sluggers int DEFAULT 0,
  gold_gloves int DEFAULT 0,
  season_mvps int DEFAULT 0,
  hofs int DEFAULT 0
);
