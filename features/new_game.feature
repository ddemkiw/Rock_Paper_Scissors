Feature: Starting the game
  In order to play Rock_Paper_Scissors
  As a player
  I want to start a new game

  Scenario: Home Page
    Given I am on the homepage
    Then I should see the image "rps.jpeg"

  Scenario: New Game
    Given I am on the homepage
    When I follow "New Game"
    Then I should see the image "rock.png"
    Then I should see the image "paper.gif"
    Then I should see the image "scissors.jpg"

  Scenario: Draw
  	Given I am on '/new_game'
  	When I press "paper"