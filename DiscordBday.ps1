# https://github.com/EvotecIT/PSDiscord
Import-Module 'C:\Users\admin\Documents\PSDiscord\PSDiscord.psd1'

# Discord Webhook to #otakklub channel
$DiscordURI = 'https://discordapp.com/api/webhooks/553378215687618579/MkLOyEJSFVXldQN98gbBWkorPC2gbmbx5vByHuRfc1sFsIY-H1lUnSOrT0H5s2cLbxqj'
$BdayCsv = Import-Csv 'C:\Scripts\DiscordBday\DiscordBday.csv'
$CurrentDate = (Get-Date -Format "MM/dd").ToString()

$RandomImage = Get-Random @(
    'https://i.imgur.com/geNNh0O.jpg'
    'https://i.imgur.com/CrBDGuB.jpg'
    'https://i.imgur.com/b8NPaQQ.jpg'
    'https://i.imgur.com/ArBL7Ri.jpg'
    'https://i.imgur.com/yXy7YL6.jpg'
    'https://i.imgur.com/cWfox5o.jpg'
    'https://i.imgur.com/usYRCTG.png'
    'https://i.imgur.com/nHV8PDX.jpg'
    'https://i.imgur.com/OR837Vb.jpg'
    'https://i.imgur.com/7Th5WIH.jpg'
)

foreach ($Person in $BdayCsv) {
    if ($Person.Bday -eq $CurrentDate) {
        $Name = $Person.FirstName
        $UserID = $Person.UserID
        $Age = ((Get-Date -Format "yyyy") - $Person.Year).ToString()

        if ($Age[1] -eq '1') {
            $Ordinal = 'st'
        }

        if ($Age[1] -eq '2') {
            $Ordinal = 'nd'
        }

        if ($Age[1] -eq '3') {
            $Ordinal = 'rd'
        }

        else {
            $Ordinal = 'th'
        }

        $Image = New-DiscordThumbnail -Url $RandomImage
        $Section = New-DiscordSection -Title "Happy $Age$Ordinal Birthday $Name!" -Image $Image -Description "<@$UserID>"
        Send-DiscordMessage -WebHookUrl $DiscordURI -Sections $Section
    }
}