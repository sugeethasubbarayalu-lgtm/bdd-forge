@eitc @tax-credits @turbotax
Feature: EITC Qualification Engine
  As a TurboTax user
  I want the system to determine if I qualify for the Earned Income Tax Credit
  So that I can maximize my tax refund

  Background:
    Given the tax year is 2024
    And the EITC income thresholds are loaded from IRS Publication 596
    And the investment income limit is $11,000

  # Acceptance Criteria: Basic EITC eligibility for standard filer
  @happy-path @P0
  Scenario: Single filer with two qualifying children qualifies for EITC
    Given a taxpayer with filing status "Single"
    And earned income of $38,000
    And 2 qualifying children under age 19
    And investment income of $2,500
    When the EITC eligibility check is performed
    Then the taxpayer should qualify for EITC
    And the estimated credit amount should be approximately $5,980
    And the credit should be classified as "refundable"

  # Acceptance Criteria: MFJ filer with no children (age-restricted)
  @happy-path @P1
  Scenario: Married filing jointly with no qualifying children
    Given a taxpayer with filing status "Married Filing Jointly"
    And combined earned income of $22,000
    And 0 qualifying children
    And both taxpayers are between ages 25 and 65
    And investment income of $1,200
    When the EITC eligibility check is performed
    Then the taxpayer should qualify for EITC
    And the estimated credit amount should be approximately $600

  # Acceptance Criteria: Income boundary at exact threshold
  @edge-case @boundary @P0
  Scenario: Income at exact EITC threshold for Head of Household with 3 children
    Given a taxpayer with filing status "Head of Household"
    And earned income of $55,768
    And 3 qualifying children under age 19
    And investment income of $0
    When the EITC eligibility check is performed
    Then the taxpayer should be flagged for threshold review
    And the system should display a notice about income proximity to the limit

  # Acceptance Criteria: Investment income disqualification
  @edge-case @P1
  Scenario: Taxpayer disqualified due to excessive investment income
    Given a taxpayer with filing status "Single"
    And earned income of $30,000
    And 1 qualifying child
    And investment income of $11,500
    When the EITC eligibility check is performed
    Then the taxpayer should NOT qualify for EITC
    And the disqualification reason should be "Investment income exceeds $11,000 limit"
    And the system should suggest reviewing investment income sources

  # Acceptance Criteria: MFS filer ineligibility
  @error-handling @P0
  Scenario: Married Filing Separately is ineligible for EITC
    Given a taxpayer with filing status "Married Filing Separately"
    And earned income of $25,000
    And 1 qualifying child
    When the EITC eligibility check is performed
    Then the taxpayer should NOT qualify for EITC
    And the disqualification reason should be "MFS filing status is not eligible for EITC"
    And the system should suggest considering "Married Filing Jointly" status
