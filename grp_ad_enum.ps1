$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$PDC = ($domainObj.PdcRoleOwner).Name
$SearchString = "LDAP://"
$SearchString += $PDC + "/"
$DistinguishedName = "DC=$($domainObj.Name.Replace('.', ',DC='))"
$SearchString += $DistinguishedName
$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SearchString)
$objDomain = New-Object System.DirectoryServices.DirectoryEntry
$Searcher.SearchRoot = $objDomain
#$Searcher.filter="(objectClass=Group)" #List all domain groups
#$Searcher.filter="(objectClass=Group)" #List grp members
$Result = $Searcher.FindAll()
Foreach($obj in $Result)

# List all domain groups
<# 
{
$obj.Properties.name
}
#>

#List grp members
<# 
{
$obj.Properties.member
}
#>