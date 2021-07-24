# SERVICENOW TICKET SAMPLE AUDITING TOOL
# This function injests a csv export from ServiceNow reports, selects a specified percentage of them, prints the selected items to screen, and then allows the list to be exported and appended onto a log file along with a timestamp.

function audits {

    # CONFIGURATION VARIABLES

    # Import File Path:  Specify the path to your import folder.  Include the wildcard symbol at the end (*) in order for you to be able to use any file name that appears in the injest folder
    # IMPORTANT:  An error will occur if you have more than one file inside the injest folder - remove your csv from this location after your import is finished.
    # EXAMPLE:  C:\Users\example.user\Desktop\auditScript\injest\*
    $importLocation = ''

    # Export File Path:  Specify the path to where you would like the function to export a list of the tickets you audited, include the name of your export file.
    # NOTE:  The function will automatically append the items pulled along with a timestamp (format:  YYYYMMDDHHmm) and a space for readability between each block.
    # EXAMPLE:  'C:\Users\example.user\Desktop\auditScript\output\outputFile'
    $exportLocation = ''
    
    # Percentage of items to check:  Format as a decimal (example - 20% = 0.2)
    $percentage = 0.0

    # Error Handling conducted by a try/catch.  If an error is encountered a generic message will be
    # displayed.
    try {
        cls
        Write-Host "=============================="
        Write-Host "=                            ="
        Write-Host "=  SERVICENOW AUDITING TOOL  ="
        Write-Host "=                            ="
        Write-Host "=============================="
        Write-Host ""
        Write-Host ""
        Write-Host "      Importing CSV...        "
        Write-Host ""
        Write-Host ""
        Pause
        
    # Injest CSV
        $importedCsv = import-csv $importLocation
        

    # Save Number column from CSV into an array.  
    #IMPORTANT:  update this section to match the desired column header from your export (example:  ($importedCsv.Number))
        $importedItems = [array]($importedCsv.Tickets)

    # Count number of items in array
        $numberOfItems = $importedItems.Count

    # Calculate desired percentage of the number of items in array
        $amountToAudit = [math]::Ceiling(($numberOfItems * $percentage))

    # Randomly select desired percentage of the items injested, output them to screen in order.
        
        # Generate unique seed for get-random
        $randomizerSeed = (Get-Date).Ticks.ToString().Substring(9)

        # Save desired percentage of the items as a variable.
        $outputItems = [array](get-random -SetSeed $randomizerSeed -Count $amountToAudit -inputObject($importedItems)) | sort-object

        # Print output to screen
        cls
        Write-Host "Items selected for audit:"
        Write-Host ""
        $outputItems
        Write-Host ""
        Write-Host ""
    
    # Allow user to export if desired, if not, exit the auditor.
        
        # Ask user if they want an exported text file of the items that have been audited.
        
        # If Yes - export item to specified file.
        # If No  - close the function.
        
        do {
         $exportYesNo = Read-Host "Would you like to export the audited items to your audit history file? (Y/N)"
              switch ($exportYesNo){
                   'Y' {
                         Write-Host "Exporting now..."
                         start-sleep -s 1
                         Get-Date -Format yyyyMMddHHmm | out-file $exportLocation -Append
                          $outputItems | Out-File $exportLocation -Append
                          $emptyString = " "
                          $emptyString | Out-File $exportLocation -Append
                         Write-Host ""
                         cls
                         Write-Host "Export complete."
                         Write-Host ""
                         Write-Host ""
                         Pause
                         cls
                         return
                   }
                   'N' {
                        cls
                        Write-Host "Exiting Function..."
                        Write-Host ""
                        #start-sleep -S 1
                        cls
                        return
                   }
            default {
                 write-host "Invalid input received, please try again."
                 Write-Host ""
                 Pause

                   }
            }
            
         }
         while ($exportYesNo -ne 'y') -and ($exportYesNo -ne 'n')
        break
        

    }
    Catch {
        
        # Display a generic error message if an error occurs
        Write-Host "An unexpected error has ocurred."
        Pause
    }


}

# Call function
audits