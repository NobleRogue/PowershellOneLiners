import-csv "C:\temp\DNSKill.csv" -Delimiter ";" | ForEach-Object {$checkname = ($_.name+'.'+$_.site+'.'+(get-addomain).dnsroot);try {$tdnsip = (resolve-dnsname $checkname -server 127.0.0.1 -ErrorAction SilentlyContinue).IPAddress; Remove-DnsServerResourceRecord -RRType A -zonename (get-addomain).dnsroot -Name ($_.name+'.'+$_.site) -RecordData $tdnsip -PassThru -Force -ErrorAction SilentlyContinue} catch {Write-Host "Unable to resolve DNS record:  " $checkname  -ForegroundColor Red}}
