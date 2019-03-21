# Discord Birthday Message
Automatically send a discord birthday message to a specified channel when it is someone's birthday. Utilizes the [PSDiscord module](https://github.com/EvotecIT/PSDiscord) to interact with Discord webhooks.

## How to use
Create a daily scheduled task on Windows to run this script. 

**Example**
```
Send-DiscordBirthdayMessage -DiscordURI 'https://discordapp.com/api/webhooks/553378215687618579/MkLOyEJSFVXldQN98gbBWkorPxxxxxxT0H5s2cLbxqj' -CsvPath 'C:\Scripts\DiscordBirthday.csv'
```
