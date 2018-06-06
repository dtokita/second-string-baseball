CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  away_name text NOT NULL,
  home_name text NOT NULL,
  away_score int NOT NULL,
  home_score int NOT NULL,
  away_hits int NOT NULL,
  home_hits int NOT NULL,
  away_errors int NOT NULL,
  home_errors int NOT NULL,
  winning_pitcher text,
  losing_pitcher text,
  saving_pitcher text,
  date_of_game date,
  home boolean,
  win boolean,
  playoff boolean
);
