-- Fails: a MEASURE column can't be returned directly.
SELECT Songs_total_streams FROM GRAPH_EXPAND("music.MusicGraph") LIMIT 1
