require_relative('./guests')

class Room

  attr_reader :guests, :songs, :capacity, :entry_fee

  def initialize(guests, songs, capacity, entry_fee)
    @guests = guests
    @songs = songs
    @capacity = capacity
    @entry_fee = entry_fee
  end

  def find_guest(guest_name)
    @guests.find {|guest| guest == guest_name}
  end

  def add_guest_to_room(guest_name, guest_money)
    if @guests.length() >= @capacity
      return "Sorry, no more space in this room."
    elsif guest_money.to_i() < @entry_fee
      return "You don't have enough money for the entry fee."
    else
      guest_money.to_i() - @entry_fee
      @guests << guest_name
    end
  end

  def remove_guest_from_room(guest_name)
    @guests.delete(guest_name)
    return @guests
  end

  def find_song(song_name)
    @songs.find {|song| song == song_name}
  end

  def add_song_to_room(song_name)
    @songs << song_name
  end

  def remove_song_from_room(song_name)
    @songs.delete(song_name)
    return @songs
  end

end