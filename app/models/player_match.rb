class PlayerMatch < ApplicationRecord
  # Tabela de relacionamento para linkar todos jogadores com partidas
  belongs_to :player, class_name: 'User', foreign_key: 'player_id'
  belongs_to :match
end