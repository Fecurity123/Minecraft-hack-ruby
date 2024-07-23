# Minecraft Custom Mod with JRuby

## Overview

This project demonstrates how to create a Minecraft mod using JRuby to interact with Minecraft's Java API. The mod includes custom hitbox functionality and a trigger bot that responds to specific events.

## Features

- **Custom Hitbox**: Modify the hitbox of a player or entity.
- **Trigger Bot**: Responds to player actions such as joining the server, moving, and executing commands.

## Prerequisites

- **Minecraft Server**: You need a Minecraft server that supports plugins, such as Spigot or Paper.
- **JRuby**: Java implementation of Ruby. [Download JRuby](https://www.jruby.org/download).
- **JDK**: Java Development Kit. [Download JDK](https://www.oracle.com/java/technologies/javase-downloads.html).
- **Maven/Gradle**: Build tools for compiling the project.

## Installation

1. **Set Up Minecraft Server**

   - Download and install a Minecraft server (e.g., Spigot or Paper) from the [official website](https://papermc.io/downloads).

2. **Install JRuby**

   - Download and install JRuby from [JRuby’s official website](https://www.jruby.org/download).
   - Ensure JRuby is correctly installed by running `jruby -v` in your terminal.

3. **Build the Plugin**

   - Clone this repository:
     ```sh
     git clone https://github.com/Fecurity123/Minecraft-hack-ruby.git
     cd minecraft-custom-mod
     ```

   - Build the project using Maven or Gradle. For Maven, use:
     ```sh
     mvn clean package
     ```

   - This will generate a JAR file in the `target` directory.

4. **Install the Plugin**

   - Copy the generated JAR file from the `target` directory to the `plugins` folder of your Minecraft server.

5. **Start the Server**

   - Start or restart your Minecraft server. The plugin should now be loaded and active.

## Usage

- **Custom Hitbox**

  - To apply a custom hitbox to a player, use the provided Ruby script:
    ```ruby
    require 'java'
    include Java

    java_import 'org.bukkit.Bukkit'
    java_import 'org.bukkit.entity.Player'
    java_import 'org.bukkit.util.BoundingBox'

    def set_custom_hitbox(entity)
      if entity.is_a?(Player)
        bounding_box = BoundingBox.new(entity.location.x - 1.0, entity.location.y, entity.location.z - 1.0,
                                        entity.location.x + 1.0, entity.location.y + 2.0, entity.location.z + 1.0)
        entity.send_message("Custom hitbox applied: #{bounding_box.to_s}")
      else
        puts "Entity is not a player."
      end
    end

    server = Bukkit.get_server
    player = server.get_player("player_name")  # Replace "player_name" with the player's name

    if player
      set_custom_hitbox(player)
    else
      puts "Player not found."
    end
    ```

- **Trigger Bot**

  - The trigger bot responds to events such as player join, move, and command execution. The logic is embedded in the plugin's Ruby code.

## Development

- **Add Features**: Modify the Ruby scripts to add new features or customize the existing functionality.
- **Contribute**: Fork this repository, create a feature branch, and submit a pull request with your changes.

## Troubleshooting

- **Plugin Not Loading**: Ensure JRuby is properly installed and configured. Check server logs for errors.
- **Script Errors**: Verify that the Ruby scripts are correctly formatted and compatible with JRuby.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions or support, please contact [yourname@example.com](mailto:yourname@example.com).

