class Match < ApplicationRecord
  self.table_name = "matches"
    
  # Jogadores da partida
  has_many :player_matches
  has_many :players, through: :player_matches

  # Dono da partida que também pode ser um jogador
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  # Quadra para esta partida
  belongs_to :court

  validates :date_time, presence: true

  def valida_quantidade_jogadores
    errors.add("Nao existe o mínimo de jogadores necessários") if self.players.count < 4 
  end
end


