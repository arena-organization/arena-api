class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_establishments

  def index
    @admin_clients = User.all_without_current_admin(current_user)
    @clients_all = User.all
    @clients_your_city = User.all_your_city(current_user)
    @clients_are_not_your_city = User.all_your_region(current_user)
    @new_clients_month = new_clients_month
  end

  def show
    @clients = User.all_without_current_admin(current_user) if params["your-clients"].present?
    @clients = User.all if params["all-clients"].present?
    @clients = User.all_your_city(current_user) if params["clients-your-city"].present?
    @clients = User.all_your_region(current_user) if params["clients-your-region"].present?

    render turbo_stream: turbo_stream.update(:ts_clients, partial: 'shared/clients', clients: @clients)
  end

  private
  def current_establishments 
    @establishments = Establishment.all_for_admin(current_user)
  end

  def new_clients_month
    start_current_month = Time.zone.now.beginning_of_month
    end_current_month = Time.zone.now.end_of_month

    User.all_without_admins(current_user).where(created_at: start_current_month..end_current_month)
  end

  def clients_all
    #TODO Escrever scope dentro do user onde clients são user clients nao user manager
    @clients ||= User.clients
  end
end
  