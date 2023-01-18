@actions
Feature: try Actions elements

  Background:
    * configure driver = { type: 'chrome', showDriverLog: true }
    
    
  Scenario: input Action: click, clear focus
    
    * def baseUrl = 'https://www.saucedemo.com/'
    Given driver baseUrl
    And input("//*[@id='user-name']","fake name")
    And delay(3000)
    And clear("//*[@id='user-name']")
    And delay(3000)
    And input("//*[@id='user-name']","standard_user")
    And focus("//*[@id='password']")
    And delay(3000)
    And input("//*[@id='password']","secret_sauce")
    #When click("//*[@id='login-button']")
    When submit().click("//*[@id='login-button']")
  @select
  Scenario: Select 
    
    * def baseUrl = 'https://demoqa.com/select-menu'
    Given driver baseUrl
    And delay(4000)
    And select("#oldSelectMenu", '{}Voilet')
    And delay(4000)
    
   
  @switchPage
  Scenario: switch page when there are a multiple table opened  (not working good)
    
    * def baseUrl = 'https://training.rcvacademy.com/'
    Given driver baseUrl
    And click('{}Automation Practice page' )
    And print driver.title
    And switchPage(1)
    And print driver.title
    And delay(6000)
    And switchPage(2)
    And print driver.title
    And delay(6000)
    And delay(4000)
    And switchPage('https://training.rcvacademy.com/')
    And delay(4000)
    #cu-form-1657531827922 > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > input:nth-child(1)
    
  @dialog
  Scenario: test dialog/alert 
    
    * def baseUrl = 'https://www.w3schools.com/js/tryit.asp?filename=tryjs_alert'
    Given driver baseUrl
    And delay(4000)
    And switchFrame("#iframeResult")
    And delay(4000)
    And click("//button[text()='Try it']")
    And delay(4000)
    And dialog(true) 
    And delay(4000)

    @dialog2
  Scenario: test dialog/alert with accept and refuse
    
    * def baseUrl = 'https://www.w3schools.com/js/tryit.asp?filename=tryjs_confirm'
    Given driver baseUrl
    And delay(4000)
    #And switchFrame(0)
    And switchFrame("#iframeResult")
    And delay(5000)
    When click("//button[text()='Try it']")
    And delay(4000)
    And dialog(false) 
    And match html('p#demo') contains 'You pressed Cancel!'
    And delay(4000)
    