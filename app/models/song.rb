class Song < ActiveRecord::Base
 belongs_to :artist
 has_many :genres, through: :song_genres
 has_many :song_genres

 def slug
   name.to_s.gsub(/[^0-9A-Za-z]+/, '-').downcase
 end

 def self.find_by_slug(slug)
   Song.all.find{|song| song.slug == slug}
end
end
