class Establishment < ApplicationRecord
  # Dono do estabelecimento
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  # Clientes do estabelecimento
  has_many :clients, class_name: 'User', foreign_key: 'client_id'

  # Quadras do estabelecimento
  has_many :courts

  validates :name, :address, :phone, 
            :open_at, :closed_at, presence: true

end