class RosterSerializer < ActiveModel::Serializer
  attributes :id, :roster_name
  has_many :players
end
