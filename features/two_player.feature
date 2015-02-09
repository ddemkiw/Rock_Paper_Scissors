# Feature: Play a game
#   In order to play rock, paper, scissors
#   As a bored person
#   I want to play the game

# Scenario: Greet
#   Given I am on the homepage
#   Then I should see "Rock Paper Scissors"

# Scenario: Set my name
#   Given I am on the homepage
#   And I fill in "name" with "Jake"
#   And I press "submit"
#   Then I should see "Hi, Jake, let's play."

# Scenario: Player wins
#   Given I have set my name as "Jake"
#   And I am on /play
#   And the computer chooses "scissors"
#   And I press "rock"
#   Then I should see "Jake wins."

# Scenario: Player draws
#   Given I have set my name as "Jake"
#   And I am on /play
#   And the computer chooses "scissors"
#   And I press "scissors"
#   Then I should see "Draw."
#   And I should not see "Jake wins."
#   And I should not see "You lose."

# Scenario: Player loses
#   Given I have set my name as "Jake" 
#   And I am on /play
#   And the computer chooses "scissors"
#   And I press "paper"
#   Then I should see "Computer wins."
#   And I should not see "Jake wins."
#   And I should not see "Draw."

# Scenario: Multiplayer
#   Given I have set my name as "Jake"
#   And I am on the homepage
#   And I select "multiplayer" from "gametype"
#   And there is a player called "Clint"
#   Then I should see "Hi Jake, you're playing Clint."