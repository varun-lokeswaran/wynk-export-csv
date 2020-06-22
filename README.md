# Wynk Export to CSV
Export all your Wynk songs list Json into CSV which can then be plugged into TuneMyMusic for importing into other platforms like Spotify/Youtube Music

## Steps to pull out playlists/songs Json from Wynk and export it into a useful CSV file:
* **Step 1:** Log in to Wynk Web Application(https://wynk.in/)
* **Step 2:** Go to the playlist you want to import
* **Step 3:** In your browser, open the Developer Tools(F12 should work)
* **Step 4:** Navigate to "Network Tab" and press F5 to refresh so that all the files are loaded once again
* **Step 5:** Look for a file starting with the name "playlist" or "items", right click it -> Copy -> Copy Response(Google Chrome)
* **Step 6:** Paste the contents into a text file and save it as a JSON file(.json)
* **Step 7:** Repeat Step 5 and 6 if there are more than one file(usually if the count of songs is greater than 48), save the Jsons as seperate file like Items1, Items2, Items3 etc.
* **Step 8:** Download the **"Export-SongsToCSV.ps1"** script 
* **Step 9:** Run it in Powershell - .\Export-SongsToCSV.ps1 from root of the project and pass in the path of the json file you had created in the previous step Eg. C:\{YourUserName}\wynk-export-csv\sample-items and a path for storing final results CSV

The CSV will have 2 columns - SongTitle, Artist

You can then use this CSV in platforms like **TunyMyMusic** to export music to Spotify/Youtube Music etc
