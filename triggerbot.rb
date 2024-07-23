require 'java'
include Java

java_import 'org.bukkit.Bukkit'
java_import 'org.bukkit.event.Listener'
java_import 'org.bukkit.event.EventHandler'
java_import 'org.bukkit.event.player.PlayerJoinEvent'
java_import 'org.bukkit.event.player.PlayerMoveEvent'
java_import 'org.bukkit.event.player.PlayerCommandPreprocessEvent'
java_import 'org.bukkit.plugin.java.JavaPlugin'

class CustomPlugin < JavaPlugin
  def on_enable
    get_server.get_plugin_manager.register_events(PlayerEventListener.new, self)
    get_logger.info("CustomPlugin enabled!")
  end
end

class PlayerEventListener
  include Java::OrgBukkitEventListener


  def on_player_join(event)
    player = event.get_player
    player.send_message("Welcome to the server, #{player.name}!")
  end

 
  def on_player_move(event)
    player = event.get_player
    if player.location.y < 50  # Пример условия: игрок на высоте меньше 50
      player.send_message("You are below height 50!")
    end
  end

  def on_player_command(event)
    command = event.get_message
    if command.start_with?('/specialcommand')
      event.get_player.send_message("Special command executed!")
    end
  end
end
