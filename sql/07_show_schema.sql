-- The GRAPH_EXPAND column list without running GRAPH_EXPAND.
DECLARE schema STRING DEFAULT '';
CALL BQ.SHOW_GRAPH_EXPAND_SCHEMA('music.MusicGraph', schema);
SELECT schema;
