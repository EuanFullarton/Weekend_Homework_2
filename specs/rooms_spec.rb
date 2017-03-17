require ('minitest/autorun')
require_relative ('../rooms')
require_relative ('../guests')
require_relative ('../songs')


class TestRoom < MiniTest::Test

  def setup
    @percy = Guest.new("Percy")
    @reginald = Guest.new("Reginald")
    @agnes = Guest.new("Agnes")

    @guests = [@percy.guest_name, @reginald.guest_name, @agnes.guest_name]

    @tragedy = Song.new("Tragedy")
    @sweet_child = Song.new("Sweet Child O Mine")
    @walk_this_way = Song.new("Walk This Way")

    @songs = [@tragedy.song_name, @sweet_child.song_name, @walk_this_way.song_name]

    @room1 = Room.new(@guests, @songs, 5)

  end

  def test_room_has_guests
    assert_equal(["Percy", "Reginald", "Agnes"], @room1.guests)
  end

  def test_room_has_songs
    assert_equal(["Tragedy", "Sweet Child O Mine", "Walk This Way"], @room1.songs)
  end

  def test_add_guest_to_room
    assert_equal(["Percy", "Reginald", "Agnes", "Norman"], @room1.add_guest_to_room("Norman"))
  end

  def test_remove_guest_from_room
    assert_equal(["Percy", "Agnes"], @room1.remove_guest_from_room("Reginald"))
  end

  def test_add_song_to_room
    assert_equal(["Tragedy", "Sweet Child O Mine", "Walk This Way", "Dancing in the Dark"], @room1.add_song_to_room("Dancing in the Dark"))
  end

  def test_if_room_is_full
    assert_equal(["Percy", "Reginald", "Agnes", "Norman"], @room1.add_guest_to_room("Norman"))
    assert_equal(["Percy", "Reginald", "Agnes", "Norman", "Jim"], @room1.add_guest_to_room("Jim"))
    assert_equal("Sorry, no more space in this room.", @room1.add_guest_to_room("Frank"))
  end


end

