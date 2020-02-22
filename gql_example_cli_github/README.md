# Example Dart Application 

This is a simple command line application to showcase how you can use the gql_link. 

To run this application:

1. First clone this repository and navigate to this directory
2. Install all dart dependencies
3. create a file `bin/local.dart` with the content:
   ```dart
   const String yourPersonalAccessToken =
      '<yourPersonalAccessToken>';
   ```
4. Then run the Application using the commands below:
   
   1. **List Your Repositories**

   ```
   pub run main.dart
   ```

   2. **Star Repository**

   ```
   pub run main.dart -a star --id <REPOSITORY_ID_HERE>
   ```

   3. **Unstar Repository**

   ```
   pub run main.dart -a unstar --id <REPOSITORY_ID_HERE>
   ```

**NB:** Replace repository id in the last two commands with a real Github Repository ID. You can get by running the first command, IDs are printed on the console. 