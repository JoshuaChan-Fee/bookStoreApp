# README
=========================================================
Guide on how to use Rails 6 and Auth0 to build an API with both authorized and open endpoints.

Prerequisites:
1. Have Rails 6, Ruby and SQLite3 installed 
2. Have an Auth0 account. If you don't have one, you can sign up for a free Auth0 account here (https://auth0.com/signup)

Steps for setup:
1. Create a New Auth0 API
	a. Head to the API section of your Auth0 dashboard and click the "Create API" button. Fill out the form with the following values:
		- Name: Rails Secure API
		- Identifier: https://rails-secure-api
		- Signing Algorithm: RS256 (this should be the default selection)
	b. Copy the identifier value (https://rails-secure-api) 
	c. Grab your Auth0 Domain (AUTH0_DOMAIN). Unless you're using a custom domain, this value will be [TENANT_NAME].auth0.com. If you're unsure what this value is, open the "Test" tab in your API's settings and look at the url argument in the code sample under "Asking Auth0 for tokens from my application"
	d. Execute this command 
		- $ EDITOR="vim" bundle exec rails credentials:edit --environment development
		- Add the code snippet below
			auth0:
			  api_identifier: https://rails-secure-api
			  domain: {AUTH0_DOMAIN}
2. To test out your API
	a. Head back to the API page of your Auth0 Dashboard and click on "Rails Secure API" to view the API details. Click the "Test" tab and scroll down to the "Asking Auth0 for tokens from my application" section. Under the "Response" heading, you can copy a test access token to use in requests to your API.
	b. Now you can add the bearer token value when making your API call
		ex: curl -H "Content-Type: application/json" -H "Authorization: bearer someTokenValue" -X yourApiRequestEndpoint

=========================================================
Guide for CRON job

execute $ whenever --update-crontab --set environment='development'

You can test your Rake task by executing it from the command line as below.
	$ rails batch:check_book_inventory

=========================================================
Things that can improve

Add a new table with store_id, book_id, stock and status as columns and this will reduce the clutter of duplicate values in the Book table.
We would have to remove the stock and status from Book table and now Book will just contain the information of the book.

