$credential = Get-Credential
$credential.Password | ConvertFrom-SecureString | Set-Content C:\IAC-TISIP-2022\Azure_Credentials.txt