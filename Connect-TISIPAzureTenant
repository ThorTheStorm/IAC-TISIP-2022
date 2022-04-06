function Connect-TISIPAzureTenant {
    param ()
    $TenantID       = '02feabb9-444e-4f66-9c13-6a8f04b75c2f'
    $SubscriptionID = 'efc1e7b1-5729-4eea-b33e-12cc6b1c0183'
    $UserID         = 'bca34191-7057-48c8-a27a-0cca02a90200'
    $Secret         = Get-Content C:\IAC-TISIP-2022\Azure_Credentials.txt | ConvertTo-SecureString

    $Credentials    = New-Object System.Management.Automation.PsCredential($UserID, $Secret)

    if ($null -eq $Credentials) {
        $Credentials = Get-Credential
    }

    Connect-AzAccount -ServicePrincipal -Credential $Credentials -TenantID $TenantID -Subscription $SubscriptionID

}