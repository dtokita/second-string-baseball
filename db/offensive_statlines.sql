CREATE TABLE offensive_statlines (
  id SERIAL PRIMARY KEY,
  game_id int NOT NULL,
  player_id int NOT NULL,
  pas int DEFAULT 0,
  at_bats int DEFAULT 0,
  hits int DEFAULT 0,
  walks int DEFAULT 0,
  strikeouts int DEFAULT 0,
  singles int DEFAULT 0,
  doubles int DEFAULT 0,
  triples int DEFAULT 0,
  homeruns int DEFAULT 0,
  rbis int DEFAULT 0,
  runs int DEFAULT 0,
  stolen_bases int DEFAULT 0,
  caught_stealings int DEFAULT 0
);
