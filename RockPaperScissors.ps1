# Rock Paper Scissors Game
function rockps {
    # main functionality loop
    $gameActive = $true
    

    # Opponent Choices
    $opponentOptions = [array]("Rock", "Paper", "Scissors")
    $playerMove = 'Rock'

    do {
    cls
    Write-Host "==========================="
    Write-host "= ROCK / PAPER / SCISSORS ="
    Write-Host "==========================="
    
    # Main gameplay section
    do {
         $playerMove = Read-Host "Choose your move"
         # Create a variable to store a unique seed for get-random.
         $randomizerSeed = (Get-Date).Ticks.ToString().Substring(9)
         $opponentMove = [string](get-random -setSeed $randomizerSeed -count 1 -InputObject($opponentOptions))
         
         # If player and opponent choose the same option - draw 
         if ($playerMove -eq $opponentMove){
              cls
              Write-host "Player chooses " $playerMove
              Write-host "Opponent chooses " $opponentMove
              Write-host "It's a draw!"
              Write-host ""
              $yesNo = read-host "Play again? (Y/N)"
              switch ($yesNo){
                   'y'{
                        write-host ''
                   }
                   'n'{
                        exit
                   }
                   default {
                        Write-Host "I didn't quite catch that.  Exiting game.."
                        exit
                   }
              }
         }
         # If player chooses rock and opponent chooses scissors - win
         if ($playerMove -eq 'rock' -and $opponentMove -eq 'scissors'){
              cls
              Write-host "Player chooses " $playerMove
              Write-host "Opponent chooses " $opponentMove
              Write-host "Player Wins!"
              Write-host ""
              $yesNo = read-host "Play again? (Y/N)"
              switch ($yesNo){
                   'y'{
                        write-host ''
                   }
                   'n'{
                        exit
                   }
                   default {
                        Write-Host "I didn't quite catch that.  Exiting game.."
                        exit
                   }
              }
         }
         # If player chooses rock and opponent chooses paper - lose
         if ($playerMove -eq 'rock' -and $opponentMove -eq 'paper'){
              cls
              Write-host "Player chooses " $playerMove
              Write-host "Opponent chooses " $opponentMove
              Write-host "Opponent Wins!"
              Write-host ""
              $yesNo = read-host "Play again? (Y/N)"
              switch ($yesNo){
                   'y'{
                        write-host ''
                   }
                   'n'{
                        exit
                   }
                   default {
                        Write-Host "I didn't quite catch that.  Exiting game.."
                        exit
                   }
              }
         }
         # If player chooses paper and opponent chooses rock - win
         if ($playerMove -eq 'paper' -and $opponentMove -eq 'rock'){
              cls
              Write-host "Player chooses " $playerMove
              Write-host "Opponent chooses " $opponentMove
              Write-host "Player Wins!"
              Write-host ""
              $yesNo = read-host "Play again? (Y/N)"
              switch ($yesNo){
                   'y'{
                        write-host ''
                   }
                   'n'{
                        exit
                   }
                   default {
                        Write-Host "I didn't quite catch that.  Exiting game.."
                        exit
                   }
              }
         }
         # If player choses paper and opponent chooses scissors - lose
         if ($playerMove -eq 'paper' -and $opponentMove -eq 'scissors'){
              cls
              Write-host "Player chooses " $playerMove
              Write-host "Opponent chooses " $opponentMove
              Write-host "Opponent Wins!"
              Write-host ""
              $yesNo = read-host "Play again? (Y/N)"
              switch ($yesNo){
                   'y'{
                        write-host ''
                   }
                   'n'{
                        exit
                   }
                   default {
                        Write-Host "I didn't quite catch that.  Exiting game.."
                        Write-Host ''
                        pause
                        exit
                   }
              }
         }
         # If player chooses scissors and opponent chooses rock - lose
         if ($playerMove -eq 'scissors' -and $opponentMove -eq 'rock'){
              cls
              Write-host "Player chooses " $playerMove
              Write-host "Opponent chooses " $opponentMove
              Write-host "Opponent Wins!"
              Write-host ""
              $yesNo = read-host "Play again? (Y/N)"
              switch ($yesNo){
                   'y'{
                        write-host ''
                   }
                   'n'{
                        exit
                   }
                   default {
                        Write-Host "I didn't quite catch that.  Exiting game.."
                        exit
                   }
              }
         }
         # If plaer chooses scissors and opponent chooses paper - win
         if ($playerMove -eq 'scissors' -and $opponentMove -eq 'paper'){
              cls
              Write-host "Player chooses " $playerMove
              Write-host "Opponent chooses " $opponentMove
              Write-host "Player Wins!"
              Write-host ""
              $yesNo = read-host "Play again? (Y/N)"
              switch ($yesNo){
                   'y'{
                        write-host ''
                   }
                   'n'{
                        exit
                   }
                   default {
                        Write-Host "I didn't quite catch that.  Exiting game.."
                        exit
                   }
              }
         }
         


    }
    while ($playerMove -eq "rock" -or $playerMove -eq "paper" -or $playerMove -eq "scissors")
    
    }
    while ($gameActive -eq $true)
}

# Call Function
rockps