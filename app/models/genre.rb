class Genre < ActiveRecord::Base
 has_many :songs, through: :song_genres
 has_many :artists, through: :songs
 has_many :song_genres

 def slug
   name.to_s.gsub(/[^0-9A-Za-z]+/, '-').downcase
 end

 def self.find_by_slug(slug)
   Genre.all.find{|genre| genre.slug == slug}
end
end
