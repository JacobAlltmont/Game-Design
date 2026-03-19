# Game Overview
...
# Controls
Normal Movement: WASD / arrow keys
 - if direction is opposite of gravity (ex: gravity is down and direction is up), acts as the jump key
 - if direction is perpendicular to gravity (ex: gravity is down, direction is left), will move the player that direction
 - if the same as gravity, will do nothing
Zero Gravity Movement: WASD / arrow keys, and Space
 - if not touching a surface, WASD and arrow keys will accelerate the player in their respective directions
 - if on a surface, WASD and arrow keys can slide you along the surface (note: not implemented yet)
 - if on a surface, Spacebar will jump you off the surface, with the direction dependent on what direction keys are being held down:
    - a direction parallel to the surface will make them jump outwards, but more towards that direction (diagonal jumps)
    - a direction perpendicular and away from the surface makes them jump faster than the default speed
    - a direction perpendicular and into the surface makes them jump slower than default speed
    (note: directional jumping is not currently implemented)
Test Gravity Changes
 - pressing I, J, K, L, and O will set the room's current gravity:
    - I: sets gravity up
    - J: sets gravity left
    - K: sets gravity down
    - L: sets gravity right
    - O: sets gravity to zero
    (Note: no hotkeys change the gravity magnitude at this point)

