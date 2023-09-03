description = "Bem-vindo(a) à minha quadra de padel!"
birthdate = '07/06/1999'
password = '12345678'
phone = '053999725462'
birthdate = '07/06/1999'

# Users 
manager = User.create(email: "manager_one@gmail.com", password: password, 
                      password_confirmation: password, first_name: "Joao", 
                      last_name: 'Almeida', phone: phone, 
                      birthdate: birthdate, role: "manager", confirmed_at: DateTime.now)

manager_two = User.create!(email: "manager_two@gmail.com", password: password, 
                          password_confirmation: password, first_name: "Joao", 
                          last_name: 'Almeida', phone: phone, 
                          birthdate: birthdate, role: "manager", confirmed_at: DateTime.now)

client_one = User.create!(email: "client_one@gmail.com", password: password, 
                          password_confirmation:password, first_name: "Maria", 
                          last_name: "Rosa", phone: phone, role: "client", confirmed_at: DateTime.now)

client_two = User.create!(email: "client_two@gmail.com", password: password, 
                          password_confirmation:password, first_name: "Eduarda", 
                          last_name: "Rosa", phone: phone, role: "client", confirmed_at: DateTime.now)

# Estabelecimentos 
establishment_one = Establishment.create!(owner: manager, name: 'Padel AG', 
                                          phone:phone, open_at: "8AM", closed_at:"22PM", 
                                          address:"Rua 1", foundation_date: "2008", description: description)

establishment_two = Establishment.create!(owner: manager, name: 'Padel Canguçu', 
                                          phone:phone, open_at: "8AM", closed_at:"22PM", 
                                          address:"Rua 1", foundation_date: "2010", description: description)



# Quadras  
court_one = Court.create!(establishment: establishment_one, title: 'Quadra padel')

court_two = Court.create!(establishment: establishment_one, title: 'Quadra de futebol')

court_three = Court.create!(establishment: establishment_two, title: 'Quadra de padel')

# Partidas
match_one = Match.create(owner: client_one, court: court_one, date_time: DateTime.now)
match_two = Match.create(owner: client_one, court: court_one, date_time: DateTime.now + 1.hour)
match_three = Match.create(owner: client_one, court: court_one, date_time: DateTime.now + 2.hour)
match_four = Match.create(owner: client_one, court: court_one, date_time: DateTime.now + 3.hour)

# players para partidas
2.times { match_one.players << client_one }
2.times { match_one.players << client_two }

2.times { match_two.players << client_one }
2.times { match_two.players << client_two }

2.times { match_three.players << client_one }
2.times { match_three.players << client_two }

2.times { match_four.players << client_one }
2.times { match_four.players << client_two }
