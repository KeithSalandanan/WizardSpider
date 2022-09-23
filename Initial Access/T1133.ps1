#Atomic Test 1 - Running Chrome VPN Extensions via the Registry 2 vpn extension
if ((!(Test-Path "C:\Program Files\Google\Chrome\Application\chrome.exe")) -Or (!(Test-Path "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"))) {
    Invoke-WebRequest -OutFile $env:temp\ChromeStandaloneSetup64.exe https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BFD62DDBC-14C6-20BD-706F-C7744738E422%7D%26lang%3Den%26browser%3D3%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/chrome/install/ChromeStandaloneSetup64.exe
    Start-Process $env:temp\ChromeStandaloneSetup64.exe /S
} 

$chrome = Get-Process chrome -ErrorAction SilentlyContinue
if ($chrome) {
  $chrome.CloseMainWindow()
  if (!$chrome.HasExited) {
    $chrome | Stop-Process -Force
  }
}
Remove-Variable chrome

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

$extList = "fcfhplploccackoneaefokcmbjfbkenj", "fdcgdnkidjaadafnichfpabhfomcebme"
    foreach ($extension in $extList) {
        New-Item -Path HKLM:\Software\Wow6432Node\Google\Chrome\Extensions\$extension -Force
        New-ItemProperty -Path "HKLM:\Software\Wow6432Node\Google\Chrome\Extensions\$extension" -Name "update_url" -Value "https://clients2.google.com/service/update2/crx" -PropertyType "String" -Force
    }
   
Start chrome
Start-Sleep -Seconds 30
Stop-Process -Name "chrome"

#Cleanup Commands:
# $extList = #{extension_id}
# foreach ($extension in $extList) {
# Remove-Item -Path "HKLM:\Software\Wow6432Node\Google\Chrome\Extensions\$extension" -ErrorAction Ignore}