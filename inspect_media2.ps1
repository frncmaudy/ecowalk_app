Add-Type -AssemblyName System.Drawing
$refPath = "C:\Users\Maudy\.gemini\antigravity\brain\930b0f5c-9b26-4f61-a7f3-cf60a7c52e24\.user_uploaded\media_1793649128335_00dce2a6.png"
$img = [System.Drawing.Image]::FromFile($refPath)
Write-Host "media 2 size: $($img.Width) x $($img.Height)"
$img.Dispose()

