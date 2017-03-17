require_relative('./guests')
class Room

  attr_reader :guests, :songs, :capacity

  def initialize(guests, songs, capacity)
    @guests = guests
    @songs = songs
    @capacity = capacity
  end

  def add_guest_to_room(guest_name)
    if @guests.length() >= @capacity
      return "Sorry, no more space in this room."
    else
      @guests << guest_name
    end
  end

  def remove_guest_from_room(guest_name)
    @guests.delete(guest_name)
    return @guests
  end

  def add_song_to_room(song_name)
    @songs << song_name
  end

end