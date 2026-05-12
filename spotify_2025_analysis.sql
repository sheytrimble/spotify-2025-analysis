-- Spotify 2025 Analysis
-- Author: Cheyenne Trimble 
-- Project: Spotify Wrapped 2025 - Top Songs Analysis
-- Tool: SQLiteOnline (SQL)
-- Date: 2026

-- Dataset: top_songs_2025.csv
-- Description: Analysis of top 50 Spotify songs based on streams, audio features, and genre


--==============================================
-- Query 1: Top 10 Songs by Streams
-- Purpose: Identify the highest performing songs in 2025
--==============================================

SELECT song_title, artist,streams_2025_bil
FROM top_songs_2025
ORDER BY streams_2025_bil DESC
LIMIT 10;

--==============================================
-- Query 2: Song Count by Genre
-- Purpose: Identify dominant genres among top songs 
--==============================================

SELECT primary_genre, COUNT (*) AS song_count
FROM top_songs_2025
GROUP BY primary_genre
ORDER BY song_count DESC;

--==============================================
-- Query 3: High Energy Songs
-- Purpose: Analyze whether high-energy songs perform well
--==============================================

SELECT song_title, artist, energy, streams_2025_bil
FROM top_songs_2025
WHERE energy> 0.7
ORDER BY streams_2025_bil DESC;


--==============================================
-- Query 4: Explicit vs Non-Explicit Songs
-- Purpose: Compare performance based on content type
--==============================================

SELECT explicit, AVG(streams_2025_bil)
FROM top_songs_2025
GROUP BY explicit;