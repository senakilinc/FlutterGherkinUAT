Feature: Counter Button

    As a user
    I want to tap the plus button
    So that I can see the counter increment

    Scenario: User taps on counter button
        Given the user is at the counter dashboard
        And the counter value is at 0
        When the user taps on the plus button
        Then the counter value is at 1