#bridge_story.rb
require "./wyndwood.rb"
include Wyndwood


puts = <<END 
Duncan stops in front of the bridge. He can barely contain himself as he sniffs the air, searching for that
feast, barely keeping his forepaws on the ground. What could it be? Chicken parmagiana? Steak tartare? 

Bacon? Mountains of bacon? Please oh please let it be bacon!

And as he neared the bridge, he thought that yes...

Yes!!! There was a faint whif of bacon in the air!

#{$stats[:hunt] > dice_roll ? "But wait! Something else, too, hiding in wait. A dirty, stinking, troll." : "Was there something else in the air? Duncan thought so, but coudn't make it out."}

END