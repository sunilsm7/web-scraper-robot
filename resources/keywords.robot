*** Settings ***
Library           OperatingSystem
Library           RPA.Browser

*** Keywords ***
Store the latest ${number_of_tweets} tweets by user name "${user_name}"
    Open Twitter homepage    ${user_name}
    Run Keyword And Ignore Error    Accept cookie notice
    Store tweets    ${user_name}    ${number_of_tweets}
    [Teardown]    Close Browser

Open Twitter homepage
    [Arguments]    ${user_name}
    Open Available Browser    ${TWITTER_URL}/${user_name}

Accept cookie notice
    ${cookie_acceptance_link}=    Get cookie acceptance link locator
    Wait Until Element Is Visible    ${cookie_acceptance_link}
    Click Element    ${cookie_acceptance_link}

Store tweets
    [Arguments]    ${user_name}    ${number_of_tweets}
    ${tweets_locator}=    Get tweets locator    ${user_name}
    Wait Until Element Is Visible    ${tweets_locator}
    @{tweets}=    Get WebElements    ${tweets_locator}
    ${tweet_directory}=    Get tweet directory    ${user_name}
    Create Directory    ${tweet_directory}
    ${index}=    Set Variable    1
    FOR    ${tweet}    IN    @{tweets}
        Exit For Loop If    ${index} > ${number_of_tweets}
        ${screenshot_file}=    Set Variable    ${tweet_directory}/tweet-${index}.png
        ${text_file}=    Set Variable    ${tweet_directory}/tweet-${index}.txt
        ${text}=    Set Variable    ${tweet.find_element_by_xpath(".//div[@lang='en']").text}
        Capture Element Screenshot    ${tweet}    ${screenshot_file}
        Create File    ${text_file}    ${text}
        ${index}=    Evaluate    ${index} + 1
    END

Get tweets locator
    [Arguments]    ${user_name}
    [Return]    xpath://article[descendant::span[contains(text(), "\@${user_name}")]]

Get cookie acceptance link locator
    [Return]    xpath://span[contains(text(), "Close")]

Get tweet directory
    [Arguments]    ${user_name}
    [Return]    ${CURDIR}/../output/tweets/${user_name}