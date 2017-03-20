require ('minitest/autorun')
require_relative ('../rooms')
require_relative ('../guests')
require_relative ('../songs')


class TestRoom < MiniTest::Test

  def setup
    @percy = Guest.new("Percy", 5)
    @reginald = Guest.new("Reginald", 9)
    @agnes = Guest.new("Agnes", 6)

    @guests = [@percy.guest_name, @reginald.guest_name, @agnes.guest_name]

    @tragedy = Song.new("Tragedy")
    @sweet_child = Song.new("Sweet Child O Mine")
    @walk_this_way = Song.new("Walk This Way")

    @songs = [@tragedy.song_name, @sweet_child.song_name, @walk_this_way.song_name]

    @room1 = Room.new(@guests, @songs, 5, 2)

  end

  def test_room_has_guests
    assert_equal(["Percy", "Reginald", "Agnes"], @room1.guests)
  end

  def test_find_guest
    assert_equal("Reginald", @room1.find_guest("Reginald"))
  end

  def test_room_has_songs
    assert_equal(["Tragedy", "Sweet Child O Mine", "Walk This Way"], @room1.songs)
  end

  def test_add_guest_to_room
    assert_equal(["Percy", "Reginald", "Agnes", "Norman"], @room1.add_guest_to_room("Norman", 4))
  end

  def test_remove_guest_from_room
    assert_equal(["Percy", "Agnes"], @room1.remove_guest_from_room("Reginald"))
  end

  def test_add_song_to_room
    assert_equal(["Tragedy", "Sweet Child O Mine", "Walk This Way", "Dancing in the Dark"], @room1.add_song_to_room("Dancing in the Dark"))
  end

  def test_remove_song_from_room
    assert_equal(["Sweet Child O Mine", "Walk This Way"], @room1.remove_song_from_room("Tragedy"))
  end

  def test_if_room_is_full
    assert_equal(["Percy", "Reginald", "Agnes", "Norman"], @room1.add_guest_to_room("Norman", 4))
    assert_equal(["Percy", "Reginald", "Agnes", "Norman", "Jim"], @room1.add_guest_to_room("Jim", 4))
    assert_equal("Sorry, no more space in this room.", @room1.add_guest_to_room("Frank", 5))
  end

  def test_can_afford_entry_fee
    assert_equal(["Percy", "Reginald", "Agnes", "Norman"], @room1.add_guest_to_room("Norman", 4))
  end

  def test_cannot_afford_entry_fee
    assert_equal("You don't have enough money for the entry fee.", @room1.add_guest_to_room("Norman", 1))
  end


end

