param (
    [Parameter(Mandatory=$true)]
    [string]
    $Gatestack
)

try{
Get-CFNStack -StackName $($Gatestack)
Remove-CFNStack -StackName $($Gatestack) -Force
$count =0
while($count -lt 20){
   try{
         Get-CFNStack -StackName $($Gatestack)
         Start-Sleep -Seconds 200
         Write-Host "Deleting stack"
         $count = $count +1
       }
    catch{
         Write-Host "Stack Deleted"
         break
          }
     }
    Write-Host "Stack deleted"
} catch {
    Write-Host "There is no stack or it was deleted"
}

