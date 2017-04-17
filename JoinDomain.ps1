############
#Change DNS#
############

$DNS1 = read-host "Please enter the primary DNS"
$DNS2 = read-host "Please enter the secondary DNS"

$NICs = Get-WMIObject Win32_NetworkAdapterConfiguration |where{$_.IPEnabled -eq “TRUE”}
  Foreach($NIC in $NICs) {
$DNSServers = $DNS1,$DNS2
 $NIC.SetDNSServerSearchOrder($DNSServers)
 $NIC.SetDynamicDNSRegistration(“TRUE”)
}

#################
#Rename Computer#
#################

$computername = read-host "Enter the new name of the computer"

###################
#Enter Domain Name#
###################

$Domain = read-host "Enter the name of the Domain"

add-computer -domainname $Domain -NewName $computername

restart-computer -force
