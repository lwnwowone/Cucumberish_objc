@run
Feature: A game for guessing 2 numbers

    Scenario: Test Input
        Given It's a game init with 2 and 3

        #case1
        When Input 8
        Then I should see Number1

        #case2
        When Input "9"
        Then I should see "Number2"

        #case3
        When Input "6"
        Then I should see "Both"
