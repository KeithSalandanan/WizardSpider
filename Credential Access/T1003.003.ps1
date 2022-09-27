#Atomic Test #7 - Create Volume Shadow Copy with Powershell

(gwmi -list win32_shadowcopy).Create('C:\','ClientAccessible')