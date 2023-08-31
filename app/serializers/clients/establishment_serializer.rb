class Clients::EstablishmentSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :courts
end
