# == Schema Information
#
# Table name: artists
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  has_many :tracks,
    through: :albums,
    source: :tracks

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
      albums = self.albums
        .select('albums.*, COUNT(*) AS track_counts')
        .joins(:tracks)
        .group('albums.id')
        # .order('COUNT(*) DESC')
      album_counts = {}
      albums.each do |album|
        album_counts[album.title] = album.track_counts
      end
      album_counts
  end
end
