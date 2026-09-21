-- Every aggregate MEASURE supports, on the Songs node.
CREATE OR REPLACE PROPERTY GRAPH music.MusicGraph
NODE TABLES (
  music.Labels KEY (label_id)
    PROPERTIES (label_id, label_name, marketing_budget,
      MEASURE(SUM(marketing_budget)) AS total_budget),
  music.Artists KEY (artist_id)
    PROPERTIES (artist_id, artist_name, label_id,
      MEASURE(COUNT(artist_id)) AS artist_count),
  music.Songs KEY (song_id)
    PROPERTIES (song_id, title, artist_id, streams,
      MEASURE(SUM(streams))              AS total_streams,
      MEASURE(AVG(streams))              AS avg_streams,
      MEASURE(MIN(streams))              AS min_streams,
      MEASURE(MAX(streams))              AS max_streams,
      MEASURE(COUNT(song_id))            AS song_count,
      MEASURE(COUNT(DISTINCT artist_id)) AS distinct_artists),
  music.Playlists KEY (playlist_id)
    PROPERTIES (playlist_id, playlist_name, followers,
      MEASURE(SUM(followers)) AS total_followers),
  music.PlaylistEntries KEY (entry_id)
    PROPERTIES (entry_id, playlist_id, song_id,
      MEASURE(COUNT(entry_id)) AS placement_count)
)
EDGE TABLES (
  music.PlaylistEntries AS EntryToSong
    SOURCE KEY (entry_id) REFERENCES PlaylistEntries(entry_id)
    DESTINATION KEY (song_id) REFERENCES Songs(song_id)
    NO PROPERTIES,
  music.PlaylistEntries AS EntryToPlaylist
    SOURCE KEY (entry_id) REFERENCES PlaylistEntries(entry_id)
    DESTINATION KEY (playlist_id) REFERENCES Playlists(playlist_id) NO PROPERTIES,
  music.Songs AS SongToArtist
    SOURCE KEY (song_id) REFERENCES Songs(song_id)
    DESTINATION KEY (artist_id) REFERENCES Artists(artist_id) NO PROPERTIES,
  music.Artists AS ArtistToLabel
    SOURCE KEY (artist_id) REFERENCES Artists(artist_id)
    DESTINATION KEY (label_id) REFERENCES Labels(label_id) NO PROPERTIES
)
