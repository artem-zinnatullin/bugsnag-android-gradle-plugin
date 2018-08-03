Feature: Plugin integrated in project with ABI APK splits

Scenario: ABI Splits project builds successfully
    When I build "abi_splits" using the "standard" bugsnag config
    Then I should receive 10 requests

    And the request 0 is valid for the Android Mapping API
    And the field "versionCode" for multipart request 0 equals "8"

    And the request 1 is valid for the Android Mapping API
    And the field "versionCode" for multipart request 1 equals "7"

    And the request 2 is valid for the Android Mapping API
    And the field "versionCode" for multipart request 2 equals "1"

    And the request 3 is valid for the Android Mapping API
    And the field "versionCode" for multipart request 3 equals "4"

    And the request 4 is valid for the Android Mapping API
    And the field "versionCode" for multipart request 4 equals "2"
    And the field "apiKey" for multipart request 4 equals "TEST_API_KEY"
    And the field "versionName" for multipart request 4 equals "1.0"
    And the field "appId" for multipart request 4 equals "com.bugsnag.android.example"

    And the request 5 is valid for the Build API
    And the payload field "appVersionCode" equals "8" for request 5

    And the request 6 is valid for the Build API
    And the payload field "appVersionCode" equals "7" for request 6

    And the request 7 is valid for the Build API
    And the payload field "appVersionCode" equals "1" for request 7

    And the request 8 is valid for the Build API
    And the payload field "appVersionCode" equals "4" for request 8

    And the request 9 is valid for the Build API
    And the payload field "appVersionCode" equals "2" for request 9
    And the payload field "appVersion" equals "1.0" for request 9
    And the payload field "apiKey" equals "TEST_API_KEY" for request 9

Scenario: ABI Splits automatic upload disabled
    When I build "abi_splits" using the "all_disabled" bugsnag config
    Then I should receive no requests

Scenario: ABI Splits manual upload of build API
    When I build the "X86-release" variantOutput for "abi_splits" using the "all_disabled" bugsnag config
    Then I should receive 1 request
    And the request 0 is valid for the Android Mapping API
    And the field "apiKey" for multipart request 0 equals "TEST_API_KEY"
    And the field "versionCode" for multipart request 0 equals "7"
    And the field "versionName" for multipart request 0 equals "1.0"
    And the field "appId" for multipart request 0 equals "com.bugsnag.android.example"
