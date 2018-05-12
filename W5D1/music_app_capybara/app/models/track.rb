# == Schema Information
#
# Table name: tracks
#
#  id       :bigint(8)        not null, primary key
#  album_id :integer          not null
#  title    :string           not null
#  ord      :integer          not null
#  lyrics   :text
#  bonus    :boolean          default(FALSE)
#

class Track < ApplicationRecord

  validates :title, :ord, :album_id, presence: true

  belongs_to :album,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Album
end
