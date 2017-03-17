require_relative ('./rooms')
require_relative ('./guests')
require ('pry')

class Viewer

  attr_reader :user_name, :user_money

  def start

    @percy = Guest.new("Percy", 5)
    @reginald = Guest.new("Reginald", 9)
    @agnes = Guest.new("Agnes", 6)

    @guests = [@percy.guest_name, @reginald.guest_name, @agnes.guest_name]

    @tragedy = Song.new("Tragedy")
    @sweet_child = Song.new("Sweet Child O Mine")
    @walk_this_way = Song.new("Walk This Way")

    @songs = [@tragedy.song_name, @sweet_child.song_name, @walk_this_way.song_name]

    @room1 = Room.new(@guests, @songs, 5, 2)


    puts "Welcome to the Karaoke bar! Please input your name."
    user_name = gets.chomp()
    puts ""
    puts "How much money have you got with you?"
    user_money = gets.chomp()
    puts ""
      if user_money.to_i() >= @room1.entry_fee.to_i()
        puts "Hi #{user_name}! Come on in."
        puts ""
        return true
      else 
        puts "Sorry #{user_name}, you don't have enough money to get in."
        return false
      end
  end

  def options_menu
    puts "You're here for your birthday party, so you now have the power to invite friends or eject people from the room. You also have complete control of the playlist."
    puts ""
    puts "What would you like to do?"
    puts "1. View guest list" 
    puts "2. Invite friend"
    puts "3. Remove someone from premises"
    puts "4. View song queue"
    puts "5. Add song to queue"
    user_choice = gets.chomp()
    if user_choice == '1'
        
      elsif user_choice == '2'
        # go to add_guest_to_room method
      elsif user_choice == '3'
        # go to remove_guest_from room method
      elsif user_choice == '4'
        # return list of songs, and allow user to add another song to the queue
      elsif user_choice == '5'
        # add song to list
      else return "Please choose from the above options."
      end
    end

end
