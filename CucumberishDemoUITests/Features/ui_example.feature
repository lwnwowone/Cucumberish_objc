@run
Feature: Counter

    Scenario: Counter increase
        Given A clean demo app

        Then I should see value of label "lb_info" is "0"

        When Tap button "btn_action"
        Then I should see value of label "lb_info" is "1"

