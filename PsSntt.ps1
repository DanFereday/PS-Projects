# SIMPLE NETWORK TROUBLESHOOTING TOOL


#  This is a simple function designed to aid over-the-phone IT support teams.  This function can be ran as a
#  stand-alone script (make sure you set your execution policy to allow it first), or it can be placed into
#  a powershell profile and called as a function.

function sntt{

     #  Error Handling
     try {
          # Main Menu Active Counter
          #$mainMenuActiveCounter = $true
     
          #if ($mainMenuActiveCounter){
          # Print Main Menu to user's session
          Clear-Host
          Write-Host "== Simple Network Troubleshooting Tool =="
          Write-Host "=                                       ="
          Write-Host "=    1:  Show computer name             ="
          Write-Host "=    2:  Show your IP address           ="
          Write-Host "=    3:  Show full IPConfig Info        ="
          Write-Host "=    4:  Clear your DNS cache           ="
          Write-Host "=    5:  Test Connection to Google      ="
          Write-Host "=    Q:  Exit Function.                 ="
          Write-Host "=                                       ="
          Write-Host "========================================="
          
     
          # Main Menu Functionality
          $userSelection = read-host "Please make a selection"
          switch($userSelection){
          # MENU OPTIONS
     
          # Option 1:  Show the computer name.
          '1' {
               Clear-Host
               Write-Host "Your Computer Name is:  "
               hostname
               Write-Host ""
               Write-Host ""
               pause
               SNTT
          }
     
     
          # Option 2:  Show IP address, clean up output for end user readability.
          '2' {
               Clear-Host
               $ipV4 = Test-Connection -ComputerName (hostname) -Count 1 | select IPV4Address
               # $ipTemp = $ipV4 -replace ".*=" -replace "}"
               Write-Host "Your IP Address is:  "
               write-host $ipV4
               write-host ""
               write-host ""
               pause
               SNTT
          }
     
          # Option 3:  Show Full IPConfig Info
          '3' {
               Clear-Host
               IPConfig
               write-host ""
               write-host ""
               pause
               SNTT
          }
     
          # Option 4:  Flush DNS Cache
          '4' {
               Clear-Host
               IPConfig /FlushDNS
               write-host ""
               write-host ""
               pause
               SNTT
          }

          # Option 5:  Ping Google
          '5' {
               Clear-Host
               Write-Host "Testing Connection Now..."
               ping 8.8.8.8 -4
               write-host ""
               write-host ""
               Pause
               SNTT
          }
     
     
          # Selecting 'Q' or 'q' will close the program.
          'Q'{
               Clear-Host
               Write-Host "Exiting Function..."
               Write-Host ""
               Write-Host ""
               pause
               Clear-Host
               break
               
          }
     
     
          # Invalid Input Handling
          default {
               Write-Host ""
               write-host "I'm sorry, I didn't recognize that selection.  Please try again."
               Write-Host ""
               pause
               Clear-Host
               SNTT
          }
          }
     }
     Catch {
          "An error has occurred.  Closing Powershell Session."
          ""
          ""
          Pause
          Exit
     }
 
 
 
      
 }   