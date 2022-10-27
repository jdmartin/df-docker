# df-docker
Just a simple dockerized dwarf-fortress.

# Notes
- Based on ubuntu:jammy.
- Installs locales, libncursesw5, and dwarf-fortress
- Dwarf Fortress Specific:
  - Sets `PRINT_MODE` to TEXT
  - Sets `TRUETYPE` to NO
  - Sets `SOUND` to NO
  - Sets `INTRO` to NO
  
# Execution
For my part, I use a command like this to run my game:
  
  ```docker run -it --network none --security-opt="no-new-privileges:true" --rm --mount type=bind,source=/path/to/data/movies,target=/root/.local/share/dwarf-fortress/run/data/movies --mount type=bind,source=/path/to/data/save,target=/root/.local/share/dwarf-fortress/run/data/save --name dwarf-fortress songsthatsaved/dwarf-fortress```
  
  This command:
  - Isolates the game by turning off network access.
  - Ensures the container cannot change privileges after execution. [(See Reference)](https://docs.docker.com/engine/reference/run/)
  - Makes the container ephemeral
  - Mounts a movies directory
  - Mounts a saves directory
