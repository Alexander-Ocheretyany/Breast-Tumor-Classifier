(Get-Content -path .\wdbc.data -Raw) -replace 'B','0' | Set-Content -Path .\wdbc.data
(Get-Content -path .\wdbc.data -Raw) -replace 'M','1' | Set-Content -Path .\wdbc.data