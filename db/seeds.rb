# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
GameHorse.destroy_all
GameUser.destroy_all
Game.destroy_all
Horse.destroy_all
UserHorse.destroy_all
Boo.destroy_all
Hype.destroy_all
GameWinner.destroy_all

dane = User.create(username: "Dane", password: "dane1", deposit: 50)
jason = User.create(username: "Jason", password: "jason1")
jack = User.create(username: "Jack", password: "jack1", deposit: 60)
kev = User.create(username: "Kev901", password: "jack1", number_wins: 4, winnings: 42.60)
x = User.create(username: "Xperson4", password: "jack1", number_wins: 3, winnings: 27.90)
brady = User.create(username: "Brady45", password: "jack1", number_wins: 1, winnings: 16.20)
john = User.create(username: "JohnLennon", password: "jack1", number_wins: 2, winnings: 33.35)


g1 = Game.create(jackpot: 4.25, minimum_bet: 1, joinable: false, winner: "Kev901")
g2 =Game.create(jackpot: 5.60, minimum_bet: 1, joinable: false, winner: "Xperson4")
g3 =Game.create(jackpot: 4.90, minimum_bet: 1, joinable: false, winner: "Brady45")
g4 =Game.create(jackpot: 7.10, minimum_bet: 1, joinable: false, winner: "JohnLennon")

GameUser.create(user_id: kev.id, game_id: g1.id)
GameUser.create(user_id: kev.id, game_id: g2.id)
GameUser.create(user_id: kev.id, game_id: g3.id)
GameUser.create(user_id: kev.id, game_id: g4.id)

GameUser.create(user_id: x.id, game_id: g1.id)
GameUser.create(user_id: x.id, game_id: g2.id)
GameUser.create(user_id: x.id, game_id: g3.id)

GameUser.create(user_id: brady.id, game_id: g1.id)
GameUser.create(user_id: brady.id, game_id: g2.id)

GameUser.create(user_id: john.id, game_id: g1.id)
GameUser.create(user_id: john.id, game_id: g2.id)
GameUser.create(user_id: john.id, game_id: g3.id)
# GameUser.create(game_id: g1.id, user_id: dane.id, extra_bet: 1, total_bet: 1)
# GameUser.create(game_id: g1.id, user_id: jason.id, extra_bet: 1, total_bet: 1)
# GameUser.create(game_id: g1.id, user_id: jack.id, extra_bet: 1, total_bet: 1)
# h1 = Horse.create(name: "horse1", speed: 50)
# h2 = Horse.create(name: "horse2", speed: 51)
# h3 = Horse.create(name: "horse3", speed: 53)
# h4 = Horse.create(name: "horse4", speed: 55)

# GameHorse.create(game_id: g1.id, horse_id: h1.id)
# GameHorse.create(game_id: g1.id, horse_id: h2.id)
# GameHorse.create(game_id: g1.id, horse_id: h3.id)
# GameHorse.create(game_id: g1.id, horse_id: h4.id)

# UserHorse.create(user_id: dane.id, horse_id: h1.id)
# UserHorse.create(user_id: jason.id, horse_id: h2.id)
# UserHorse.create(user_id: jack.id, horse_id: h2.id)

# GameWinner.create(user_id: dane.id, game_id: g1.id, moneyWon: 2)
# GameWinner.create(user_id: jack.id, game_id: g1.id, moneyWon: 2)



# g2 = Game.create(jackpot: 20, minimum_bet: 5, active: false, joinable: false)
# GameUser.create(game_id: g2.id, user_id: dane.id)
# GameUser.create(game_id: g2.id, user_id: jack.id)

# g3 = Game.create(jackpot: 20, minimum_bet: 5)





