####> This code and all components © 2015 – 2019 Wowza Media Systems, LLC. All rights reserved.
####> This code is licensed pursuant to the BSD 3-Clause License.

# Establish a client with your API authentication information
#
# This uses environment variables to set the API key and access key.  This
# approach is recommended to add a layer of protection against exposing your
# API keys.
#
#raise "WSC_API_KEY environment variable is not set" unless ENV.has_key?('WSC_API_KEY')
#raise "WSC_API_ACCESS_KEY environment variable is not set" unless ENV.has_key?('WSC_API_ACCESS_KEY')

# Logging is disabled by default, but you can turn on it on by uncommenting the
# logger.level line below.
logger = Logger.new(STDOUT)
# logger.level = Logger::Severity::UNKNOWN # Disable logging output
# logger.level = Logger::Severity::WARN # Enable logging output
logger.level = Logger::Severity::DEBUG # Enable logging output

WscSdk.configure do |config|
# 10/18/23 Changing from API to JSON, changes are below
# HASH OUT: Lines 10-11,24-26
# ADD:
#  config.api_key      = ENV['WSC_API_KEY']
#  config.access_key   = ENV['WSC_API_ACCESS_KEY']
  config.authorization = eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NTU3NzEwZS0yYzhlLTQ1MDgtOTEwOS1hZWMxNTEwODAxY2UiLCJqdGkiOiI1NmZhODgwNDBkMDZhZTZlNTQzZGExODcxYTc4MmZhODAyM2NjMGVkZGI2YzI3MmQ3YzY0YzFjMTE1NDQxZWJlZmVkNWM3N2NkZGJjZTJhMCIsImlhdCI6MTY5NzQyMzc3NCwibmJmIjoxNjk3NDIzNzc0LCJleHAiOjIzMjg1NzU3NzQsInN1YiI6Ik9VLThhYTJiMWRlLTk0MjctNDA5MC1iYjdmLWQ5NzEyMDRkOWU4MyJ9.TO24jGuD28XodAWlj6IjHa7RnB-FYssXDku4B4irD3MXxteQ3a6fHEzAEY-zE6X4wnfPpsQrZnAu9V3INWiEguM0ouO7VnlKHBWGSQ-Bd2xZB7JWYyX27GdlZcjIi2fd0JcBG3uULoXNt2di1bt62Gq8S9iR1eHStI-5y6AAGco9_jv9zJrmYUUuS2_EGCAkvJMWY-S4rR_9z-f47YHMX78jX9qrEyglzOLrC7iF4pIiRdIw7DxHYSFiKUjrkpQlZjkJkdfjTv14Y9C8mlWi9gASm42bAR8J3xFHXscViWkgufTYs3TFazzBmYjt2HA7insL6oICxgs9papRhCr70vqlhnXEyy9Lj6ZV5YOKj0z1dnsPn4k5FSqMAuTXjPJ3d9wkL0ZQKUl406MV9SpBJeiZ_2-GN4XNR3YBGlwkN4UhslOXvUT6ohOUhBFwruc1wJ-enjeAyqwH4Ri5ItF5F-MSgtsbcyvf2q-jqH2qQpg6PW8tvbP2RlHzJs6qymY32hBlIzMkpUt2reDqqapfQ9AJ7GlTcTLTUvWK73txr-lLdkE-REDxwgfpmLf0agHFLL_b-_ycML6qcwYBQDT8n3P2EpROAWO68H11wzrnwgIkTW61nqGmD5BgT0rxrr4r9t2Cc6_8FDNOFB62l00TkmgVvUPxN6UshT3g_duIfxg
#  config.logger       = logger

  # This value is set to Production, but you can change it to
  # WscSdk::SANDBOX_HOSTNAME if you want to test your code before incurring
  # charges on your account.
  #
  # NOTE: You will need to update your keys if you switch between the Production
  # and Sandbox hostnames.
  #
  config.hostname     = WscSdk::PRODUCTION_HOSTNAME
end

$client     = WscSdk::Client.new

logger.debug("Client Info:")
$client.info.each do |k, v|
  logger.debug(" |> #{k.to_s.ljust(20)}: #{v}")
end
