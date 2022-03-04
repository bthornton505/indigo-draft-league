# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# CREATE LEAGUE COMMISH (TRAINER)
commish = Trainer.create!(first_name: 'Brenden', last_name: 'Thornton', email: 'thorntonbrenden@gmail.com', password: 'seedPassword')

# CREATE OTHER TRAINERS
player2 = Trainer.create!(first_name: 'Brandon', last_name: 'Calero', email: 'bcalero091591@gmail.com', password: 'seedPassword')
player3 = Trainer.create!(first_name: 'Jared', last_name: '', email: 'fakeEmailJared@gmail.com', password: 'seedPassword')
player4 = Trainer.create!(first_name: 'Cameron', last_name: 'Calero', email: 'fakeEmailCameron@gmail.com', password: 'seedPassword')
player5 = Trainer.create!(first_name: 'Dillon', last_name: 'Calero', email: 'fakeEmailDillon@gmail.com', password: 'seedPassword')
player6 = Trainer.create!(first_name: 'Alex', last_name: 'Villa', email: 'fakeEmailAlex@gmail.com', password: 'seedPassword')
player7 = Trainer.create!(first_name: 'Nico', last_name: 'Ommati', email: 'fakeEmailNico@gmail.com', password: 'seedPassword')
player8 = Trainer.create!(first_name: 'Edgar', last_name: '', email: 'fakeEmailEdgar@gmail.com', password: 'seedPassword')

# CREATE LEAGUE
league = League.create!(name: 'Indigo League')

# CREATE ALL TEAMS
team1 = Team.create!(trainer_id: commish.id, league_id: league.id, name: 'Kanto Embers')
team2 = Team.create!(trainer_id: player2.id, league_id: league.id, name: 'Mossdeep City Cosmics')
team3 = Team.create!(trainer_id: player3.id, league_id: league.id, name: 'Lavender Town Gastly Haze')
team4 = Team.create!(trainer_id: player4.id, league_id: league.id, name: 'Saffron Kicks')
team5 = Team.create!(trainer_id: player5.id, league_id: league.id, name: 'Mt. Silver Pangoros')
team6 = Team.create!(trainer_id: player6.id, league_id: league.id, name: 'Veilstone City Machoke Me Daddies')
team7 = Team.create!(trainer_id: player7.id, league_id: league.id, name: 'Celodan City Thunder')
team8 = Team.create!(trainer_id: player8.id, league_id: league.id, name: 'Olivine City Iron Heads')
