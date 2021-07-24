# Random Password Generator
function rpg {
  
     # Usable Characters stored as an array.
     $usableChars = [array]("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "!", "@", "#", "$", "%", "&", "*")
     $supplementalNums = [array]("1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
     $supplementalChars = [array]("!", "@", "#", "$", "%", "&", "*")
     $supplementalLetters = [array]("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")
     $supplementalLower = [array]("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
     # Create a variable to store a unique seed for get-random.
     $randomizerSeed = (Get-Date).Ticks.ToString().Substring(9)
     
     # Display title and prompt user for number of desired characters.
     cls
     Write-Host "================================================="
     Write-Host "            RANDOM PASSWORD GENERATOR            "
     Write-Host "================================================="
     $charCount = read-host "Enter Number Of Characters (12-60)"
     write-host ""
     
     # Try/catch to prevent an invalid character count submission.
     try{
     
     # Generate the password, include logic to ensure every password has at least one letter, number, and special character.
     
     $randomizedPassword = [array](get-random -SetSeed $randomizerSeed -Count $charCount -inputObject($usableChars))
     # Trim $randomizedPassword down by 3
     
     $trimmedPassword = ($randomizedPassword[4..9999]) -join ''
     
     if ($charCount -lt 12){
          throw
     }
     if ($charCount -gt 60){
          throw
     }
     
          
     


     $outputSupplementalNums = (get-random -SetSeed $randomizerSeed -Count 1 -inputObject($supplementalNums)) -join ''
     $outputSupplementalChars = (get-random -SetSeed $randomizerSeed -Count 1 -inputObject($supplementalChars)) -join ''
     $outputSupplementalLetters = (get-random -SetSeed $randomizerSeed -Count 1 -inputObject($supplementalLetters)) -join ''
     $outputSupplementalLower = (get-random -SetSeed $randomizerSeed -Count 1 -inputObject($supplementalLower)) -join ''


     $outputPassword = ($trimmedPassword + $outputSupplementalLower + $outputSupplementalNums + $outputSupplementalChars + $outputSupplementalLetters) -Join ''
     
     # Print password to screen, pause before clearing to allow users to record the password before clearing it.
     write-host "Randomly Generated Password:  " $outputPassword
     write-host ""
     $gameOver = Read-Host "Would you like to generate another password? (Y/N)"
          switch($gameOver){
               'Y'{
                    cls
                    rpg
               }
               'N'{
                    cls
                    break
               }
               default {
                    Write-Host "I'm sorry, I didn't quite catch that.  Returning to function..."
                    Pause
                    cls
                    rpg

               }
          }
          break
     cls
 
     }
     catch {
          $gameOver = Read-Host "Invalid input received.  Try again? (Y/N)"
          switch($gameOver){
               'Y'{
                    cls
                    rpg
               }
               'N'{
                    cls
                    break
               }
               default {
                    Write-Host "I'm sorry, I didn't quite catch that.  Returning to function..."
                    Pause
                    cls
                    rpg

               }
          }
          break
          
          cls
          rpg
     }
 
     
 
     
 }