param ($networkpre, $serverip)

for ($i=1; $i -le 255; $i++) {

    $ipaddr = Resolve-DnsName -DnsOnly "$networkpre.$i" -Server $serverip -ErrorAction Ignore | Select-Object Name | ForEach-Object {$_.Name}
    $namehost = Resolve-DnsName -DnsOnly "$networkpre.$i" -Server $serverip -ErrorAction Ignore | Select-Object NameHost | ForEach-Object {$_.NameHost}
        
        $ipaddr | ForEach-Object {
            $lastoctet = $ipaddr.split('.')[0]
            echo "$networkpre.$lastoctet $namehost"
    }
}
