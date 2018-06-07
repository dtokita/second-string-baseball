CREATE TABLE pitching_statlines (
  id SERIAL PRIMARY KEY,
  game_id int NOT NULL,
  player_id int NOT NULL,
  ips int DEFAULT 0,
  hits int DEFAULT 0,
  ers int DEFAULT 0,
  runs int DEFAULT 0,
  walks int DEFAULT 0,
  strikeouts int DEFAULT 0,
  win boolean DEFAULT false,
  loss boolean DEFAULT false,
  save_gave boolean DEFAULT false
);
