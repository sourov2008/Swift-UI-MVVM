# Readme

##Project Setup:
This app uses MVVM architecture (e.g., Models, Views, ViewModels, Networking, etc.).

## Service:
There are two kinds of services. PostService(uses for real api call) and MockPostService(uses for unit test purpose). PostService: Whenever we will make a API call, we will use the service class to access network manager. We will prepare the necessary data to make a api call. like url, params, header etcs.  

## Networking:
Created a NetworkRouter/NetworkManager class to handle API requests. Implement a generic method for making get, post, put delete API calls. 

## Error Handling:

Implement error handling in the NetworkManager for various scenarios (e.g., no internet connection, server-side errors, etc.).
Use do-catch blocks to handle errors gracefully and display appropriate messages to the user. In error handling class we can use the logger function to laog the api & hardware stauts. 

##ViewModel:

Create a ViewModel for the list view that will hold the data and interact with the NetworkManager.
Use dependency injection to inject the PostService(PostService, or MockPostService) into the ViewModel, making it testable.

##View:
Create a SwiftUI view to display the list of titles and bodies.
Bind the view to the ViewModel using SwiftUI's @StateObject or @ObservedObject property wrappers.

##Unit Testing:
Write unit tests for the ServiceProtocol to test API calls with different scenarios, including error cases.
Write unit tests for the ViewModel to ensure it correctly handles the data and errors from the API.


## Local API File Loading:
Create a local JSON file with the sample JSON data.

