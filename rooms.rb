require_relative('./guests')
class Room

  attr_reader :guests, :songs

  def initialize(guests, songs)
    @guests = guests
    @songs = songs
  end

  def add_guest_to_room(guest)
    @guests << guest
  end

  def remove_guest_from_room(guest_name)
    @guests.delete(guest_name)
    return @guests
  end

  def add_song_to_room(song_name)
    @songs << song_name
  end

end