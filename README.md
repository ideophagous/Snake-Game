Snake game I made in Pascal just for fun.

Function names are mostly in Moroccan Darija:
- 7nch = snake
- zda7 = hit
- boita = box
- makla = food

also:
- kla = ate
- mat = died

Rules and properties of the game:

The game has 3 elements:
1. The snake: represented as a list of coordinates visualized
as the ASCII character █ for the body and the ASCII characters
╩ ╦ ╠ ╣ for the head of the snake.
2. The food: represented as the character 'o'.
3. The box: represented with the ASCII characters ║ ╗ ╝ ╔ ╚ ═ 

The snake has four types of behavior: moving, changing direction,
eating food and growing. Moving happens automatically at an 
increasing speed (relative to the size of the snake). Changing
directions happens by intervention of the user, with the arrow
keys. Eating takes place when the coordinates of head of the 
snake coincide with the coordinates of the food. Growing is the
increase of the size of the snake by one coordinate point at the
tail, which takes place right after eating.

The game is lost if the snake hits one of the sides of the box,
or hits itself.

The game is won when the number of coordinate points representing
the snake reaches 100.
