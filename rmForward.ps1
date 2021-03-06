function rmForward {
    # Check for Exchange Online Management Module, Instruct to install if not present.
    try {
         get-InstalledModule -Name ExchangeOnlineManagement | Out-Null
         
    }
    catch {
         cls
         write-host "Prerequisite module not installed."
         write-host ""
         write-host ""
         write-host "Please install the ExchangeOnlineManagment Powershell Module using an admin session before proceeding."
         write-host ""
         write-host ""
         Pause
         Exit-PSSession
    }
    # Connect to Exchange Online
    Connect-ExchangeOnline

    # Collect Target Username
    cls
    $targetMailbox = read-host "Please enter username for target Mailbox"

    # Show mailbox forwarding status for target
    write-host ""
    Write-Host "Current Mailbox Forwarding Destinations for"$targetMailbox":"
    get-mailbox $targetMailbox | FL Forward*
    Write-host ""
    Write-Host "" 
    $loopActive = $true

    # Infinite loop to force user to choose either yes or no at user selection prompt.
    While ($loopActive){
     $userSelection = read-host "Clear Forwarding Destinations? (Y/N)"
            switch($userSelection){
              'Y' {
                  # Set the mailbox Forwarding Address and Forwarding SMTP Address to null values.
                   set-mailbox $targetMailbox -ForwardingAddress $NULL -ForwardingSmtpAddress $NULL
                   write-host ""
                   Write-host "Forwarding Destinations Cleared."
                   Write-host "Exiting Session."
                   Write-host ""
                   Pause
                   # Clean up session upon exit.
                   Get-PSSession | Remove-PSSession
                   exit

              }
              'Yes' {
                  # Set the mailbox Forwarding Address and Forwarding SMTP Address to null values.
                   set-mailbox $targetMailbox -ForwardingAddress $NULL -ForwardingSmtpAddress $NULL
                   write-host ""
                   Write-host "Forwarding Destinations Cleared."
                   Write-host "Exiting Session."
                   Write-host ""
                   Pause
                   # Clean up session upon exit.
                   Get-PSSession | Remove-PSSession
                   exit
              }

              'N' {
                   cls
                   write-host "Forwarding destinations were NOT cleared."
                   write-host "Exiting Session."
                   write-host ""
                   Pause
                   # Clean up session upon exit.
                   Get-PSSession | Remove-PSSession
                   exit
              }
              'No' {
                   cls
                   write-host "Forwarding destinations were NOT cleared."
                   write-host "Exiting Session."
                   write-host ""
                   Pause
                   # Clean up session upon exit.
                   Get-PSSession | Remove-PSSession
                   exit
              }
              default {
                  # Input handling - user will be stuck in an infinite loop until they provide a yes or no value.
                   write-host "Invalid input received."
                   write-host ""
              }
            }

         }
}
