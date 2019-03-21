# Requires PSDiscord module https://github.com/EvotecIT/PSDiscord
function Send-DiscordBirthdayMessage {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$DiscordURI,

        [Parameter(Mandatory=$true, Position=1)]
        [string]$CsvPath
    )

    begin {
        $CurrentDate = (Get-Date -Format "MM/dd").ToString()
        # Add as many images as you want here
        $RandomImage = Get-Random @(
            'https://i.imgur.com/codTMrQ.jpg'
        )
    }

    process {
        foreach ($Person in (Import-Csv $CsvPath)) {
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
    }
}
