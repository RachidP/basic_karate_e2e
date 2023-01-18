Feature: bmy first login

  Background:
    * configure driver = { type: 'chrome', showDriverLog: true }

  Scenario: try to login to https://www.saucedemo.com/
  
    Given driver 'https://www.saucedemo.com/'
    And input("//*[@id='user-name']","standard_user")
    And input("//*[@id='password']","secret_sauce")
    When click("//*[@id='login-button']")
    Then match driver.title == 'Swag Labs'
    