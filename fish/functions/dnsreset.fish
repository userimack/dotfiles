function dnsreset
  # sudo networksetup -setdnsservers "USB 10/100/1000 LAN" Empty
  # sudo networksetup -setdnsservers "USB 10/100/1000 LAN" 1.1.1.1 1.0.0.1
  sudo networksetup -setdnsservers "Wi-Fi" Empty
  # sudo networksetup -setdnsservers "Wi-Fi" 8.8.8.8 8.8.4.4
  sudo networksetup -setdnsservers "Wi-Fi" 1.1.1.1 1.0.0.1
  # sudo networksetup -setdnsservers "Wi-Fi" 45.90.28.205 45.90.30.205
  ping google.com
end
