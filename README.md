# PowershellLearning
My learning journey of Powershell (ps1).

| :Calculator: |
The first project where I was exposed to PowerShell's syntax structure that almost seemed identical to C#, allowing for easier implementation/usage of functions, switch statements and user I/O resulting in a calculator script where users can perform simple arithmetic mathematics

| :File Creation: |
A dynamic script which allows users to create folders or files of any type and choose their location. 

This is where I learned about the Join operator to concatenate the user's answers into a string variable that resembles a file path, which is passed through the path operator in the New-Item command-let.   

In the case where a user wishes to create a file without inputting it's location, as their answer is used as a parameter in CreateFile/Folder function and checked using an if/elseif/else statements, a variable containing the current location of the script replaces what would be the users chosen location in the previously mentioned string variable.

| :File Finder: |
This project was created as a fun concept where users have to find harmless text files that are scattered within their system. Although entertaining, it allowed me to learn how to implement an array and other useful command-lets such as Get-Random, Set-Location and Set-Content. 
 	
| :File Organiser (ongoing): |
Inspired by John Dear's Automatic Desktop Organiser idea, this script expands on that by allowing users to organise their Downloads and a location of their choosing (work in progress). 

| :User Creation: |
Based on my Bash iteration of user creation, this script allows the user to create a local account and set its admin privileges, or remove existing users which also deletes their profile which imitates wiping the account from the system.

