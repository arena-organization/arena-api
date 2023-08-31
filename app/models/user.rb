class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
    # Include default devise modules. Others available are:
    # :lockable, :timeoutable and :omniauthable
  enum role: { client: 0, manager: 1 }

  devise :database_authenticatable, :registerable, 
         :confirmable, :recoverable, :rememberable, 
         :validatable, :trackable

  # Estabelecimentos que o User é o dono
  has_many :owned_establishments, class_name: 'Establishment', foreign_key: 'owner_id', dependent: :nullify

  # Buscar todos estabelecimentos de um cliente através da tabela client_establishments
  has_many :client_establishments, class_name: 'ClientEstablishment', foreign_key: 'client_id'
  has_many :establishments, through: :client_establishments
 
  # Buscar todas partidas de um player
  has_many :player_matches, foreign_key: 'player_id'
  has_many :matches, through: :player_matches

  # Partidas que o user é o owner
  has_many :owned_matches, class_name: 'Match', foreign_key: 'owner_id', dependent: :nullify, inverse_of: :owner

  validates :first_name, :last_name, :email, :phone, presence: true
  # before_update :validates_parameters
  
  before_save :set_uid

  private 

  def set_uid 
    self[:uid] = self[:email] if self[:uid].blank?
  end

  def validates_parameters
    return error(:zip_code) if zip_code.blank? 
    return error(:city) if zip_code.blank? 
    return error(:state) if zip_code.blank? 
  end

  def error(parameter_blank)
    errors.add(parameter_blank, "you forgot to add")
  end
end