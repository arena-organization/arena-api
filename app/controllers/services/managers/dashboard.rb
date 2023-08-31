class Services::Managers::Dashboard
  def initialize(current_user)
    @user = current_user
  end

  def informations
    {
      "possible_clients": possible_clients.count,
      "establishments_matches": establishments_matches_all.count,
      "money_month": money_month,
      "total_colected": total_colected,
      "new_clients_month": new_clients_month.count
    }
  end

  def new_clients_month
    start_current_month = Time.zone.now.beginning_of_month
    end_current_month = Time.zone.now.end_of_month

    User.all_possible_clients.where(created_at: start_current_month..end_current_month)
  end

  def possible_clients
    User.all_possible_clients
  end

  def establishments_matches_all 
    Establishment.all_matches_to_current_establishments_manager(@user).count
  end

  def manager_establishments
    Establishment.manager_establishments(@user)
  end

  def money_month
    300
  end

  def total_colected
    400
  end
end