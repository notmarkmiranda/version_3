# user
user = User.create(email: "markmiranda51@gmail.com", password: "password")
puts "user created!"
league = League.create(name: "Michael Cassano's Home League", slug: "michael-cassano-s-home-league", user_id: user.id)
puts "league created!"

# seasons
preseason = Season.last

#participants
tyler  = Participant.create(first_name: "Tyler", last_name: "Merry")
mike   = Participant.create(first_name: "Michael", last_name: "Cassano")
mark_m = Participant.create(first_name: "Mark", last_name: "Miranda")
andy   = Participant.create(first_name: "Andy", last_name: "Baum")
chris  = Participant.create(first_name: "Chris", last_name: "Kampe")
scott  = Participant.create(first_name: "Scott", last_name: "Lukes")
puts "players created!"

#game
game = Game.create(date: Date.new(2016, 10, 18),
                   buy_in_amount: 15,
                   active: false,
                   season_id: preseason.id)
game.players.create(participant_id: tyler.id,
                    game_id: game.id,
                    finishing_place: 1)
game.players.create(participant_id: mike.id,
                    game_id: game.id,
                    finishing_place: 2)
game.players.create(participant_id: mark_m.id,
                    game_id: game.id,
                    finishing_place: 3)
game.players.create(participant_id: andy.id,
                    game_id: game.id,
                    finishing_place: 4)
game.players.create(participant_id: chris.id,
                    game_id: game.id,
                    finishing_place: 5)
game.players.create(participant_id: scott.id,
                    game_id: game.id,
                    finishing_place: 6)
puts "game finished!"

game.calculate_scores
puts "game scored!"
