# == Schema Information
#
# Table name: albums
#
#  id      :bigint(8)        not null, primary key
#  band_id :integer          not null
#  title   :string           not null
#  year    :integer          not null
#  studio  :boolean          default(TRUE)
#

class Album < ApplicationRecord
  validates :band_id, :title, :year, presence: true

  belongs_to :band,
  primary_key: :id,
  foreign_key: :band_id,
  class_name: :Band

  has_many :tracks,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Track,
  dependent: :destroy
end
