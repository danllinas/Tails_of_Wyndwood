require "./wyndwood.rb"
include Wyndwood

#sets the breed stats, to be used later in the gmame
$stats = {
  hunt: 0,
  strength: 0,
  sneak: 0,
  charisma: 0
}
$duncan_hit_points = 10

$troll_stats = {
  strength: 6,
  detect: 4,
  resist_charm: 4
}

$troll_hit_points = 12

#global variables that holds info when user chooses
$breed = ""
$power = ""
$nickname = ""
$ending = 0
$game_location = ""

#this is where the script really starts. Above, setting all the variables and pieces of texts that get referenced throughout the script. 
quickly do 
  
"""
                                                                                                                           
  ****           *                    ***                                 ***                                              
 *  *************               *      ***                              ** ***                                             
*     *********                ***      **                             **   ***                                            
*     *  *                      *       **                             **                                                  
 **  *  **                              **       ****          ****    **                                                  
    *  ***            ****    ***       **      * **** *      * ***  * ******                                              
   **   **           * ***  *  ***      **     **  ****      *   ****  *****                                               
   **   **          *   ****    **      **    ****          **    **   **                                                  
   **   **         **    **     **      **      ***         **    **   **                                                  
   **   **         **    **     **      **        ***       **    **   **                                                  
    **  **         **    **     **      **          ***     **    **   **                                                  
     ** *      *   **    **     **      **     ****  **     **    **   **                                                  
      ***     *    **    **     **      **    * **** *       ******    **                                                  
       *******      ***** **    *** *   *** *    ****         ****     **                                                  
         ***         ***   **    ***     ***                            **                                                 
                                                                                                                           
                                                                                                                           
                                                                                                                           
                                                                                                                           
                                                                                                                           
                                                                                                                           
     ***** *    **   ***                                     **                                                      **    
  ******  *  *****    ***                                     **                                                      **   
 **   *  *     *****   ***                                    **   **                                                 **   
*    *  **     * **      **                                   **   **                                                 **   
    *  ***     *         ** **   ****                         **    **    ***    ****        ****       ****          **   
   **   **     *         **  **    ***  *  ***  ****      *** **     **    ***     ***  *   * ***  *   * ***  *   *** **   
   **   **     *         **  **     ****    **** **** *  *********   **     ***     ****   *   ****   *   ****   ********* 
   **   **     *         **  **      **      **   ****  **   ****    **      **      **   **    **   **    **   **   ****  
   **   **     *         **  **      **      **    **   **    **     **      **      **   **    **   **    **   **    **   
   **   **     *         **  **      **      **    **   **    **     **      **      **   **    **   **    **   **    **   
    **  **     *         **  **      **      **    **   **    **     **      **      **   **    **   **    **   **    **   
     ** *      *         *   **      **      **    **   **    **     **      **      *    **    **   **    **   **    **   
      ***      ***      *     *********      **    **   **    **      ******* *******      ******     ******    **    **   
       ******** ********        **** ***     ***   ***   *****         *****   *****        ****       ****      *****     
         ****     ****                ***     ***   ***   ***                                                     ***      
                               *****   ***                                                                                 
                             ********  **                                                                                  
                            *      ****                                                                                    
                                                                                                                           
                                                                                                                           
"""
end

line_break("*")

slowly do
"""
Welcome to Wyndwood! 
In this Tail, help Ser Duncan of Wyndwood in his quest to find food. 

Everywhere. 

All the time. 

Really, that's all Ser Duncan cares about. 

So choose your breed, your special power, and discover hunt down awesome grub!!
"""
end

spacing
line_break("*")
line_break("*")

slowly do
  "Choose your breed! Select \"PBGV\", \"Basset Hound\", \"Golden Doodle\", or \"Mutt.\""
end

slowly do
  "Or type, \"Breeds\" to learn what each breed is good at.\n" 
end

#narrative section describing breed to be displayed for user later.
$breed_info = 
"""
***
The PBGV has a stelar nose, and he can sniff out food from miles away. He's a crafty fellow, too. 
Careful when dining around PBGVs. Lose focus for one second, and he'll steal the food right from your plate.
When he's a PBGV, Duncan would rather sneak than fight, for he's just a little guy. 
***
The Basset Hound is a sturdy choice. Strong nose for hunting down food, and a charming fellow, with all 
that wrinkly skin and huge floppy ears. As a Basset, Duncan is rather stout, to put it nicely, and slow. 
***
The Golden Doodle is the most charming and regal choice. He prefers to use charm to achieve his goals, and he 
sees sneaking as reprehensible. 
***
The Mutt is a well-rounded choice, a true rennaisance dog. He has learned a little of everything in his travels, 
but he hasn't bothered to become a master of any discipline. 
"""

# getting user's choice, and downcasing for simplicity
prompt
choose_breed(STDIN.gets.chomp!)

spacing
line_break("=")

#narrative sections prompting user to choose a special power
special_power = 
"""
Now choose your special power! You can choose digging, trash diving, howling, or billy goat! 

Or type 'info' to learn more about each. 

"""

#narrative section describing the special powers.
$power_info = 
"""
Digging: Find burried treaure hidden far beneath the surface of the earth! Find other creative 
uses for this power, too, if you can. 

Trash diving: You're a when it comes to sifting through trash and finding tasty morsels! No trash can 
is too big for you. You know what they say: one man's trash is another dog's treasure.

Howling: You have the voice of a K9 angel! With that wonderful howl, you can lull humnas to sleep and
take their grub. 

Billy Goat: Some dogs are crafty, but only Duncan can take on the craftiness of a billy goat! Stomp 
on humnans as you dart past them for food, or stop them and demand a toll! The Billy Goat confers 
many mysterious powers. 
"""

slowly do
  special_power
end

prompt
choose_power(STDIN.gets.chomp!)

spacing
line_break("#")

narrative_1 = 
"""
Duncan the #{$breed} finished his dinner of kibbles and bacon, devoured all of his human's leftover steak, 
and still hungry, set out on a quest for more food! He trotted out the back door and made his way along the 
path until he reached the edge of the marvelous Wyndwood. 

Inside the Wyndwood, the wind rustled through the trees, the birds chirped, and the friendly wood animals
invited Duncan to come play. 

But did they have food?

He wasn't sure. He looked to his right, and there saw a large house. From this distance, he couldn't tell 
if anyone was home.

But was there food? 

And to his left, there was a bridge. The bridge was empty...a little too empty. 

And quiet...a little too quiet.

There was a sign at the front of the bridge. The sign read 'Come join the feast!'

"""

slowly do
  narrative_1
end

sleep(0.5)
line_break("*")

slowly do
  "Checking to see if Duncan successfuly sniffs!\n"
end

if $stats[:hunt] > dice_roll 
  slowly do
    "Duncan lifts his snout and sniffs the air. Mmmm! He smells delicious food near the bridge. And lots of it."
  end
else
  slowly do
    "Duncan lifts his head and sniffs the air, but he doesn't catch a scent."
  end
end

slowly do
"""

So many options for good 'ol Duncan. Where should he go? 

Wyndwood, house, or bridge? 
(For now, choose bridge. Wyndwood and house modules had to be sacrificed at the altar of time.)
"""
end

prompt
choose_route(STDIN.gets.chomp!)

sleep(0.5)

spacing

case $game_location
when "wyndwood"
  quickly do
"""
.                          / \         / \
                   /        |          / \
                  / \            .|.    |
                  / \  \,/      - * -       \
                   |        (\o ,/|`       / \
              /             (<X`      \    / \
             / \ \   \,/     /|      / \  \ |
             / \/ \      /           / \ / \
              | / \     / \     \     |  / \   \
            /   /|      / \    / \  \   \ |   / \
           / \ / \  /    |     / \ / \ / \    / \
           / \ / \ / \  \   /   |  / \ / \   \ |
            |   |  / \ / \ / \   /  |   |   / \     \
                \   |  / \ / \  / \  \     \/ \    / \
               / \      |   |   / \ / \   / \|  /  / \
               / \    /    \     |  / \   / \  / \  |
                |    / \  / \        |     |   / \
                     / \  / \                   |
                      |    |      
   [ ][ ]    [ ][ ]
    | '|......| '|
    |  |  __  |' |
    |__._/:_\_.__|


**You must be really dumb, or really eeeeeeevil. Didn't I say the Wyndwood and House modules had to be sacrificed 
due to time? Stop trying to break my code!!
"""
  end
  the_end
when "house"
  spacing
  quickly do
"""
            __                         __
           /%%\\                  ^    /%%\
       ^  /%%%%\\      *-*            /%%%%\
   ^     /%%%%%%\\______|____________/%%%%%%\
          |""""|%%%/^\\%%%/^\\%%%/^\\%%%|""""|   ^
          | H  |%%%|H|%%%|H|%%%|H|%%%| H  |      ^
          |    |¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾|    |
          |    |   HHH   HHH   HHH   |    |
()) ______|    |_____________________|    |_____  ()
(()/%/^\\%%|    |%%%%%%%%%%%%%%%%%%%%%|    |%%/^\\%\\(()
()/%%|H|%%|    |%%%%%%%%%%%%%%%%%%%%%|    |%%|H|%%\\()
)/%%%%%%%%|    |  ___  _/-o-\\_  ___  |    |%%%%%%%%\\(
()| HH HH |    |  HHH   | | |   HHH  |    | HH HH |()
|||_______|____|__HHH___|_|_|___HHH__|____|_______|||
_________________________   _________________________


***You must be really dumb, or really eeeeeeevil. Didn't I say the Wyndwood and House modules had to be sacrificed 
due to time? Stop trying to break my code!!
"""
  end
  the_end
when "bridge"
  quickly do
"""
                             ___....___
   ^^                __..-:'':__:..:__:'':-..__
                 _.-:__:.-:'':  :  :  :'':-.:__:-._
               .':.-:  :  :  :  :  :  :  :  :  :._:'.
            _ :.':  :  :  :  :  :  :  :  :  :  :  :'.: _
           [ ]:  :  :  :  :  :  :  :  :  :  :  :  :  :[ ]
           [ ]:  :  :  :  :  :  :  :  :  :  :  :  :  :[ ]
  :::::::::[ ]:__:__:__:__:__:__:__:__:__:__:__:__:__:[ ]:::::::::::
  !!!!!!!!![ ]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!![ ]!!!!!!!!!!!
  ^^^^^^^^^[ ]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^[ ]^^^^^^^^^^^
           [ ]                                        [ ]
           [ ]                                        [ ]
     jgs   [ ]                                        [ ]
   ~~^_~^~/   \~^-~^~ _~^-~_^~-^~_^~~-^~_~^~-~_~-^~_^/   \~^ ~~_ ^
"""
  end

end

line_break("*")
sleep(2)
clear_screen
spacing

slowly do
"""
Duncan stops in front of the bridge. He can barely contain himself as he sniffs the air, searching for that
feast, barely keeping his forepaws on the ground. What could it be? Chicken parmagiana? Steak tartare? 

Bacon? Mountains of bacon? Please oh please let it be bacon!

And as he neared the bridge, he thought that yes...

Yes!!! There was a faint whiff of bacon in the air!

"""
end

if $stats[:hunt] > dice_roll
  slowly do
    "But wait! Something else is hiding nearby. Something evil, and stinky. A dirty troll!!!"
  end
else
  slowly do
    "Was there something else in the air? Duncan thought so, but coudn't make it out. It smelled rather foul, but who cared! Bacon!!!"
  end
end

$bridge_dash = <<END
Duncan dashes across the bridge, voicing excited yips! He knows that bacon is just across the bridge.
Nothing can hide from his nose. 

As he nears the center of the bridge, he sees the pile of fresh, steaming bacon. It's arranged
in a lavish display atop a long picnic table. Some of the dishes still sizzle. 

Duncan stops and savors the aroma. Ahhh! He wants to take it all in before he tears that shit up. 

Duncan hops onto a picnic bench, lovingly inhales the bacon perfume, opens his snout --

And WHAM!!!!!!!!!!!!!!!!!! 
                                                                     
Duncan hops away from the table, startled, staring at the huge club that just knocked all his delicious
bacon to the ground...

And at the huge, ugly troll standing at the other end of that club. 
END

start_bridge_quest
prompt
bridge_choice(STDIN.gets.chomp!)

$goodbye = "Thank you for playing! Go through again and try different options for the whole story."









