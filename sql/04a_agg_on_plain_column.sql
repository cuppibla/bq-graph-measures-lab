-- Fails: AGG needs a MEASURE-typed column.
SELECT AGG(Songs_streams) FROM GRAPH_EXPAND("music.MusicGraph")
