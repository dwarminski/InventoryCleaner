#Tomek to męczydupa i nie da wygrzać kości na wypowiedzeniu
$hosts = @(2) + (5..18)
$keyPath = '/my/path/to/key/'
$logPath = '/my/path/to/logs/'

foreach ($addr in $hosts) {
    $fileName = "$logPath\$addr.txt"
    Write-Host "`n===== Connecting to 192.168.255.$addr ====="

    $tmpFile = New-TemporaryFile
    @"
screen-length disable
system-view
dis cur int
exit
exit
"@ | Out-File -FilePath $tmpFile -Encoding ascii -Force

    $cmd = "ssh -tt -C2 -i `"$keyPath`" /my/user@192.168.255.$addr < `"$tmpFile`"" #output ssh nie liczy się do transkryptu stąd te akrobacje żeby logował
    cmd.exe /c $cmd | Out-File -FilePath $fileName -Encoding utf8

    Remove-Item $tmpFile -Force
}