require 'java'
include Java

java_import 'org.bukkit.Bukkit'
java_import 'org.bukkit.entity.Entity'
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
player = server.get_player(mc.player.getName()) 

if player
  set_custom_hitbox(player)
else
  puts "Player not found."
end
