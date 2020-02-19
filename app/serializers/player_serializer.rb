class PlayerSerializer < ActiveModel::Serializer
  attributes :player_name, :warcraft_logs_link, :role, :player_class, :heart_level, :item_level, :avg_normal_parse, :avg_heroic_parse, :avg_mythic_parse
end
