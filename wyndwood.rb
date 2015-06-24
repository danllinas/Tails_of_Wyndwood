module Wyndwood

  #to output large amounts of text fast, but not instant
  def quickly
    yield.each_char {|x| putc x ; sleep(0.0005) }
  end

  #to print text at reading speed
  def slowly
    yield.each_char {|x| putc x ; sleep(0.009) }
    puts ""
  end

  #to format section breaks
  def line_break(character)
    quickly do
      character * 150
    end
    puts ""
  end

  #to format section breaks
  def spacing
    puts ""
    puts ""
    puts ""
  end

  #for user input
  def prompt
    print ">  "
  end

  #for clearing the screen
  def clear_screen
    system "clear" or system "cls"
  end

  #method to set breed stats. Will affect actions in the game. 
  def set_stats(hunt_stat, str_stat, sneak_stat, chr_stat)
    $stats[:hunt] = hunt_stat
    $stats[:strength] = str_stat
    $stats[:sneak] = sneak_stat
    $stats[:charisma] = chr_stat
  end
  
  #random number based on a d6 dice.
  def dice_roll
    return (rand(6) + 1)
  end

  def d20_roll
    return (rand(20) + 1)
  end
  
  def choose_breed(breed)
    breed.downcase!
    case breed
    when "pbgv"
      clear_screen
      set_stats(5, 2, 5, 4)
      spacing
      slowly do
        "Wonderful! You've chosen the happy breed! Here's a secret: the real Duncan is a PBGV. His nickname is \"The Long One.\""
      end
      $breed = "Petite Basset Griffon Vendeen"
      $nickname = "the long one"
    when "basset hound"
      clear_screen
      set_stats(4, 3, 2, 4)
      spacing
      slowly do
        "The Basset! Ah, wonderful choice. When he's a Basset, Duncan's nickname is \"The Deadly.\""
      end
      $breed = "Basset Hound" 
      $nickname = "the deadly"   
    when "golden doodle"
      clear_screen
      set_stats(3, 4, 1, 5)
      spacing
      slowly do
        "Regal and charismatic, Duncan is super friendly and charming when he's playing the role of Golden Doodle. His nickname is \"The Gentleman's gentleman.\""
      end
      $breed = "Golden Doodle"
      $nickname = "the gentleman's gentleman"
    when "mutt"
      clear_screen
      set_stats(3, 3, 3, 3)
      spacing
      slowly do
        "The Mutt is a jack-of-all-trades! He's street smart and flexible. His nickname is \"Kitt.\""
      end
      $breed = "Classy Mutt"
      $nickname = "kitt"   
    when "breeds"
      clear_screen
      quickly do
        $breed_info
      end
      spacing
      slowly do
        "Please choose: PBGV, Basset Hound, Golden Doodle, or Mutt"
      end
      prompt
      choose_breed(STDIN.gets.chomp!)
    else 
      puts "Please choose: PBGV, Basset Hound, Golden Doodle, Mutt, or breeds."
      choose_breed(STDIN.gets.chomp!)
    end #end of case statement
  end #end of choosebreed method

  #to choose the special power
  def choose_power(power)
    power.downcase!
    case power
    when "digging"
      clear_screen
      spacing
      puts "Ah, the digging power! Have fun throwing up dirt in search for your food treasures."
      $power = "dig"
    when "trash diving"
      clear_screen
      spacing
      puts "Humans think their food is safe in trash bins? Pfft. You'll show them."
      $power = "trash"    
    when "howling"
      clear_screen
      spacing
      puts "Arrroooooooo! Howl to lull humans to sleep and then snatch their grub."
      $power = "howl"
    when "billy goat"
      clear_screen
      spacing
      puts "Harness the craftiness and smarts of the billy goat to demand food from humans! Also useful against trolls."
      $power = "goat"   
    when "info"
      clear_screen
      spacing
      quickly do
        $power_info
      end
      puts "Please choose: digging, trash diving, howling, or billy goat."
      prompt
      choose_power(STDIN.gets.chomp!)
    else 
      puts "Please choose: digging, trash diving, howling, billy goat, or info."
      choose_power(STDIN.gets.chomp!)
    end #end of case statement
  end #endof choose power method

  #sets the chosen route
  def choose_route(route)
    route.downcase!
    case route
    when "wyndwood"
      clear_screen
      spacing
      slowly do
        "After weighing his options, Duncan trots into the Wyndwood."
      end
      sleep(1)
      $game_location = "wyndwood"
    when "house"
      clear_screen
      spacing
      slowly do
        "After weighing his options, Duncan trots toward the house." 
      end
      sleep(1)
      $game_location = "house"
    when "bridge"
      clear_screen
      spacing
      slowly do
        "A feast? Duncan can't resist! He sprints to the bridge!"
      end
      sleep(1)
      $game_location = "bridge"
    else 
      puts "Choose: Wyndwood, house, or bridge."
      choose_route(STDIN.gets.chomp!)
    end #end of case statement
  end #endof choose route method

  def start_bridge_quest
    slowly do
"""
What should Duncan do? 
  There's bacon!! Dash across that bridge and hunt! -- Press 1
  Carefully approach and investigate the scenario. -- Press 2
  Use special power! -- Press 3
"""      
    end
  end

  #branching out within the bridge story
  def bridge_choice(num)
    case num
    when "1"
      spacing
      slowly do
        $bridge_dash
      end
      what_next
    when "2"
      spacing
      bridge_sneak_narrative
      sleep(2)
      sneak_checking
    when "3"
      spacing
      if $power == "goat"
        slowly do
          "Duncan can't figure out how to billy goat around here."
        end
        start_bridge_quest
        prompt
        bridge_choice(STDIN.gets.chomp!)
      elsif $power == "howl"
        slowly do
          "Duncan howls beautifully! but nothing happens in this location."
        end
        start_bridge_quest
        prompt
        bridge_choice(STDIN.gets.chomp!)
      elsif $power == "trash"
        slowly do
          "Really? Do you see any trash around here?"
        end
        start_bridge_quest
        prompt
        bridge_choice(STDIN.gets.chomp!)
      else 
        dig_power_at_bridge
      end
    else 
      puts "Please choose: 1, 2, or 3."
      prompt
      bridge_choice(STDIN.gets.chomp!)
    end #end of case statement
  end #end of bridge choice method

  def dig_power_at_bridge
    slowly do
"""
When is there a wrong time to dig? Duncan ignores the bridge for now, and starts digging happily here and there.

Who knows where you'll find a bone?

He digs and digs...
"""
    end
    if dice_roll > 3
      slowly do 
        "...And discovers a chache of burried bones! Max strength! Treasure + 3"
      end
      $stats[:strength] = 5
      $ending += 3
      spacing
      start_bridge_quest
      prompt
      bridge_choice(STDIN.gets.chomp!)
    else
      puts "...And finds nothing. "
      spacing
      start_bridge_quest
      prompt
      bridge_choice(STDIN.gets.chomp!)
    end
  end

  def what_next
    sleep(2)
    spacing
    slowly do
"""
What will Duncan do? 
  To hell with this troll! Let's fight!!! -- Press 1
  Negotiate and charm the horns off this ugly troll. -- Press 2
  Use special power! -- Press 3
"""
    end
    prompt
    troll_fight_choice(STDIN.gets.chomp!)
  end

  def bridge_sneak_narrative
    sleep(2)
    slowly do
"""
Something is not right. That bacon was tempting, but Duncan is no fool. 

He sneaks toward the bridge, careful to keep out of sight. His nose tells him exactly where that 
bacon is. 

Duncan sneaks down the embankment, and picks his way across the rocks lining the bed of the small river.

Once across, he sneaks back up the embankment, and there, hiding, is a huge, ugly troll. 

With a very big club. 

The troll eyes the bridge. He must think he's sooooo clever to have laid this trap, but Duncan 
intends to outsmark him.
"""
    end
    sleep(2)
  end

  def howl_on_bridge #start howling power on bridge
    slowly do
"""
Duncan takes a deep breath and starts howling!

ARRRROOOOOOOOO!

'Quiet that racket, you mangy #{$breed}!'

Arrroooooooo!!!! AARRRROOOOOOOO!!!!!

'Shut...'

The troll stops to yawn. Is he getting sleepy? 
"""
    end #end slowly statement
    if ($troll_stats[:resist_charm] + dice_roll) < ($stats[:charisma] + dice_roll)
      howl_win
    else
      howl_lose
    end #end if
  end #end howl on bridge

  def billy_goat_on_bridge
    slowly do
  """
  Oh, no! That troll doesn't know what he's in for!!!

  Duncan backs up and summons the billy goat spirit within him. 

  The troll laughs. 'What's this?' he says. 

  Duncan squats on his haunches, and darts at the troll, bashing his little head right into the troll's balls!

  The troll groans. 'Ughhhhhhhh!'

  Duncan laughs and spins. He drop kicks the troll in the face, and the troll tumbles over the bridge to splatter 
  on the rocks below. 

  And Duncan sits at the picnic table to enjoy his bacon. 

  Yum. 

  Nothing beats bacon. 
  """
    end # end slowly
    $ending += 5
    spacing
    slowly do
      "Press Enter to continue." 
    end
    prompt
    STDIN.gets.chomp!
    ending_chooser($ending)
  end #end of goat on bridge method

  def charm_failure
    slowly do
"""
Duncan barks, wags his tail, rolls over, does all his awesome tricks...

But the troll just looks on in disdain. 

'Go home, little dog, before I sqquish you.' 
"""
    end
    what_next
  end

  def charm_success #start charm success story
    slowly do
"""
Duncan wags his tail and barks, cocking his head sideways at the troll. 

The troll looks at him, confused. 

Duncan sits. Lifts his paw for a high five. Barks. Rolls over. Plays dead. 

'How charming,' troll says. 'That's a good dog.' 

Ducan barks again. Sits. Stares at the troll. 

Stares at the bacon. 

'You want a treat?' the trolls asks. 

Duncan barks. 

The troll can't help it. Duncan is just too charming. He feeds Duncan bacon strips until Duncan 
can't hold anymore. Then Duncan runs home, greets his humans, begs for some more treats, and 
finds his bed for a nice, satisfying nap. 
"""
    end #end slowly
    spacing
    line_break("*")
    slowly do
      "Press Enter to continue."
    end 
    $ending += 5
    prompt
    STDIN.gets.chomp!
    ending_chooser($ending)
  end #end charming

  def troll_fight_choice(action) #start choice of action for troll fight
    case action
    when "1"
      clear_screen
      spacing
      slowly do
        "To hell with this bully! Duncan attacks!\n\n"
      end
      duncan_attack(d20_roll)
    when "2"
      clear_screen
      if ($stats[:charisma] + dice_roll) > ($troll_stats[:resist_charm] + dice_roll)
        slowly do 
          charm_success
        end
      else
        slowly do
          charm_failure
        end
      end
    when "3"
      clear_screen
      if $power == "goat"
        billy_goat_on_bridge
      elsif $power == "howl"
        howl_on_bridge
      elsif $power == "trash"
        spacing
        slowly do 
          "Really? Do you see any trash around here?\n"
        end
        slowly do
          "For being such a douche, the troll attacks!\n"
        end
        troll_attack(d20_roll)
      else 
        spacing
        slowly do
          "It's always a good time to dig!\n"
        end
        if d20_roll == 20
          slowly do
            "Critical hit! Duncan jabs his paws at the troll's balls, digging and digging as the troll howls in pain and dies a horrible death."
          end
          $ending += 5
          spacing
          line_break("#")

          slowly do
            "Press enter to continue."
          end
          prompt
          STDIN.gets.chomp!
          ending_chooser($ending)
        elsif d20_roll > 13
          slowly do 
            "Duncan digs at the troll's toes, digs and digs until he rips off one of his ugly talons.\n"
          end
          damage = dice_roll
          $troll_hit_points -= damage
          slowly do
            "You did #{damage} damage, and the troll has #{$troll_hit_points} hit points remaining."
          end
          troll_attack(d20_roll)
          if $troll_hit_points <= 0
            slowly do
              "Duncan jabs the trolls balls with his digging power! The troll's high pitched wails carry all over the forrest. Duncan enjoys his bacon."
            end
            $ending += 5
            spacing
            line_break("#")
            slowly do
              "Press enter to continue."
            end
            prompt
            STDIN.gets.chomp!
            ending_chooser($ending)
          else
          what_next
          end
        else
          slowly do
            "Duncan tries to dig at the troll's thigh, but the troll's hide is too tough."
          end
          slowly do
            "The troll attacks!"
          end
          troll_attack(d20_roll)
        end
      end
    else 
      puts "Please choose: 1, 2, or 3."
      prompt
      troll_fight_choice(STDIN.gets.chomp!)
    end #end of case statement
  end

  def ending_chooser(num)
    if num == 5
      clear_screen
      line_break("#")
      spacing
      slowly do
        "Duncan did a great job through this game. He survived and made off with the troll's bacon...but is there a better ending available? Play again to find out!"
      end
      sleep(2)
      the_end
    elsif num > 5
      clear_screen
      line_break("#")
      spacing
      slowly do
        "Great run for Duncan! He made off with the troll's bacon, and found some additional food treasures! This is the best ending so far. I know, not many fireworks, but soon.\n\n"
      end
      slowly do
        "Duncan goes home, greets his loving humans, and lays down for a well-deserved nap. He dreams of bacon.\n\n"
      end
      sleep(2)
      the_end
    else
      clear_screen
      line_break("#")
      spacing
      slowly do
        "You didn't do that great a job of helping Duncan hunt for food. Try again!"
      end
      sleep(2)
      the_end
    end
  end

  def damage_to_troll(num)
    slowly do
      "You did #{num} points of damage!"
    end
    $troll_hit_points -= num
    if $troll_hit_points < 1 
      $ending += 5
      spacing
      line_break("&")
      slowly do 
        "Duncan lands a devastating paw punch to the gonads! The troll collapses to his knees.\n\n"
      end
      slowly do
        "Duncan spins and drop kicks the troll in the face, knocking him over the side of the bridge. The troll falls to his death on the rocks down below! \n\nPress Enter to continue."
      end
      prompt
      STDIN.gets.chomp
      ending_chooser($ending)
    else
      slowly do
        "It's the troll's turn to attack!!"
      end
      troll_attack(d20_roll)
    end
  end

  def damage_to_duncan(num)
    $duncan_hit_points -= num
    slowly do
      "Duncan has #{$duncan_hit_points} hit points remaining! Be careful."
    end
    if $duncan_hit_points < 1
      slowly do
        "Oh no! The troll has defeated Duncan and sent him home without any bacon."
      end
      slowly do
        "Duncan trudges home, depressed and hungry. But his lovin humans welcome him with hugs, kisses, and treats! While not bacon, they'll have to do."
      end
      spacing
      line_break("&")
      slowly do 
        "Press Enter to continue."
      end
      prompt
      ending_chooser($ending)
    else
      what_next
    end
  end

  def duncan_attack(num)
    slowly do
      "You rolled a #{num}!\n"
    end
    if num == 20
      slowly do
        "Critical hit! Duncan lunges and rips the troll's throat out. He eats as much bacon as his stomach can hold!"
      end
      $ending += 5
      slowly do
        "Duncan can be a vicious fellow when there's food at stake."
      end
      spacing
      line_break("*")
      puts "Press Enter to continue."
      prompt
      STDIN.gets.chomp!
      ending_chooser($ending)
    elsif num >= 12
      slowly do
        "A hit!\n\n"
      end
      damage_to_troll(dice_roll)
    else
      slowly do
        "You missed! The troll attacks!!"
      end
      troll_attack(d20_roll)
    end
  end

  def troll_attack(num)
    if num == 20
      slowly do
        "Critical hit! The troll hoists Duncan in the air and tosses him in the river."
      end
      spacing
      slowly do
        "Duncan lands in the water and doggy-paddles to the shore. He makes his way home a hungry, depressed, stinky mess."
      end
      spacing
      line_break("#")
      slowly do
        "Press enter to continue."
      end
      prompt
      ending_chooser($ending)
    elsif num > 15
      slowly do
        "The troll hits Duncan!"
      end
      damage_to_duncan(dice_roll)
    else
      slowly do
        "The troll missed!"
      end
      what_next 
    end
  end

  def sneak_checking
    spacing
    line_break("*")
    slowly do
      "Checking to see if Duncan successfully sneaks!!"
    end
    if ($stats[:sneak] + dice_roll) > ($troll_stats[:detect] + dice_roll)
      evaded
    else
      caught
    end
  end

  def evaded
    sleep(2)
    spacing
    slowly do
"""
That crafty little Duncan creeps past the troll. He stuffs his jaws full of bacon. 

If he could laugh with a mouthful of bacon, he would be laughing at the troll right now.

But who cares to laugh when you can fill your stomach with bacon? 

Duncan trots to the next bridge along the river and makes his way back home, happily munching on 
that delicious bacon all along the way. 

That troll was ugly, but Duncan had to give him credit. He could make some mean bacon. 

"""
    end
    sleep(2)
    $ending += 5
    slowly do
      "Press Enter to continue."
    end
    prompt
    STDIN.gets.chomp!
    ending_chooser($ending) 
  end

  def caught
    sleep(2)
    spacing
    slowly do
"""
Duncan stealthily makes his way toward the picnic table, keeping his eye on the troll. 

He silently hops on the bench, but as he is about to shovel mountains of bacon into his mouth, 
he hears the troll start laughing. 

'Oh, silly dog,' the troll says. 'You fell for my simple trap. Now pay me my toll, or you'll
be the main course to this side of bacon.'
"""
    end
    what_next
  end

  def howl_lose #start howl
    sleep(2)
    slowly do
"""
The troll shakes off the yawn, grabs a cup of water, and splashes it on his face to wake himself up. 

'That won't work on me, Ser Duncan. You better try something else, or just go home before I eat you along with that side of bacon.'
"""
    end #end for slowly
    what_next
  end  #end for howl lose
 
  #start howl
  def howl_win
    sleep(2)
    slowly do
"""
The troll yawns again! His eyelids flutter, and he falls face first onto the bride.

He loud, rattling snores don't bother Duncan.

He sits to eat his bacon, and then makes his way home to his humans. 

His humans feed him more treats, of course. 

Duncan curls up in his nice soft bed and dreams of a conveyer belt conveying bacon 
into his drueling maul. 

He sleeps well. 
"""
    end #end for slowly
    $ending += 5
    slowly do
      "Press Enter to continue."
    end
    prompt
    STDIN.gets.chomp!
    ending_chooser($ending)
  end    #end for howl

  #start the end
  def the_end
    quickly do
"""
 ______  __ __    ___        ___  ____   ___            __  __  __ 
|      ||  |  |  /  _]      /  _]|    \ |   \          |  ||  ||  |
|      ||  |  | /  [_      /  [_ |  _  ||    \         |  ||  ||  |
|_|  |_||  _  ||    _]    |    _]|  |  ||  D  |        |__||__||__|
  |  |  |  |  ||   [_     |   [_ |  |  ||     |         __  __  __ 
  |  |  |  |  ||     |    |     ||  |  ||     |        |  ||  ||  |
  |__|  |__|__||_____|    |_____||__|__||_____|        |__||__||__|
                                                                   
"""
    end #end for quickly
    puts $goodbye
    abort
  end #end for the_end

end