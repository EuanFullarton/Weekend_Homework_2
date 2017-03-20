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



    puts "Welcome to the Karaoke bar! Entry fee is 2. What's your name?"
    @user_name = gets.chomp()
    puts ""
    puts "How much money have you got with you?"
    @user_money = gets.chomp()
    puts ""
    if user_money.to_i() >= @room1.entry_fee.to_i()
      puts "Hi #{user_name}! Come on in."
      puts ""
      puts "You're here for your birthday party, so you now have the power to invite friends or eject people from the room. You also have complete control of the playlist."
      @room1.add_guest_to_room(user_name, user_money)
      return true
    else 
      puts "Sorry #{user_name}, you don't have enough money to get in."
      return false
    end
  end

  def options_menu
    puts ""
    puts "What would you like to do?"
    puts "1. View guest list" 
    puts "2. Invite friend"
    puts "3. Remove someone from premises"
    puts "4. View song queue"
    puts "5. Add song to queue"
    puts "6. Remove song from queue"
    puts "7. Leave bar"
    user_choice = gets.chomp()
    
    if user_choice == '1'
      puts " "
      puts "Guest list:" 
      puts @room1.guests   
      puts " "     

    elsif user_choice == '2'
      puts " "
      puts "What is your friend's name?"
      friend_name = gets.chomp()
      puts " "
      puts "How much money are they bringing?"
      friend_money = gets.chomp().to_i()
      puts " "
      @room1.add_guest_to_room(friend_name, friend_money.to_i()) 
      puts " "
      if @room1.find_guest(friend_name) == friend_name
        puts "Welcome #{friend_name}!"
        puts " "
      elsif @room1.guests.length() >= @room1.capacity && friend_money.to_i() < @room1.entry_fee.to_i()
        puts "Sorry, the bar is full. #{friend_name} doesn't have enough money to enter anyway..."
        puts " "  
      elsif @room1.guests.length() >= @room1.capacity
        puts "Sorry, we're at capacity! #{friend_name} will have to wait until someone leaves."
        puts " "
      else
        puts "Unfortunately #{friend_name} can't afford the entry fee." 
      end

    elsif user_choice == '3'
      puts " "
      puts "Who would you like to remove?"
      remove_name = gets.chomp
      puts " "
      if remove_name == @user_name
        puts " "
        puts "You have asked the bouncers to kick you out, your night is over!"
        puts " "
        return false
      elsif @room1.find_guest(remove_name) != nil
        @room1.remove_guest_from_room(remove_name)
        puts "#{remove_name} has been escorted from the building."
      else
        puts " "
        puts "#{remove_name} isn't in the room."
      end

    elsif user_choice == '4'
      puts " "
      puts "Song list:" 
      puts @room1.songs   
      puts " "      

    elsif user_choice == '5'
      puts " "
      puts "Which song would you like to add to the queue?"
      new_song = gets.chomp
      @room1.add_song_to_room(new_song)
      puts " "
      puts "#{new_song} has been added to the song queue."

    elsif user_choice == '6'
      puts " "
      puts "Which song would you like to remove?"
      remove_song = gets.chomp
      puts " "
      if @room1.find_song(remove_song) != nil
        @room1.remove_song_from_room(remove_song)
        puts " "
        puts "#{remove_song} has been taken out of the queue."
      else
        puts " "
        puts "#{remove_song} isn't in the queue."
      end

    elsif user_choice == '7'
      puts " "
      puts "You leave the bar, see you again soon!"
      puts " "
      return false

    else
      puts " "
      puts "Please choose from the above options."
      puts " "
    end
  end

end
