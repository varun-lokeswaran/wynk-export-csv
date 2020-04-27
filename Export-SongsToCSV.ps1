param (
    [Parameter(Mandatory = $true)][string]$ItemsDirectory,
    [Parameter(Mandatory = $true)][string]$CsvOutDirectory
)

$FileNames = Get-ChildItem -Path $ItemsDirectory -Name
$FilesCount = $FileNames.Length
$AllResults = @()

for($i = 0; $i -lt $FilesCount; $i++) {
    $FileName = $FileNames[$i]
    Write-Output "Getting Song Data from $FileName..."
    try{
        $Songs = Get-Content -Path "$($ItemsDirectory)\$FileName" | ConvertFrom-Json -ErrorAction Stop
        if ($Songs.GetType().BaseType.Name -eq "Object") {
            $Songs = $Songs.items
        }
    }
    catch {
        Write-Output "$FileName is not a valid Json..."
        $message = $_.Exception.Message
        Write-Error "$($message.substring(0, [System.Math]::Min(80, $message.Length)))"
        exit 1
    }
    foreach($Song in $Songs) {
        $Title = $Song.title
        $Artist = $Song.artist.title
        $AllResultsObject = New-Object -TypeName psobject
        $AllResultsObject | Add-Member -MemberType NoteProperty -Name SongTitle -Value $Title
        $AllResultsObject | Add-Member -MemberType NoteProperty -Name Artist -Value $Artist
        $AllResults += $AllResultsObject
    }
}

$AllResults = $AllResults
Write-Output "Writing to Path[$CsvOutDirectory\CsvOut.csv]"
# $AllResults | Set-Content "$($CsvOutDirectory)\CsvOut.csv"
$AllResults | Export-Csv "$($CsvOutDirectory)\CsvOut.csv" -NoTypeInformation
Write-Output "Successfully wrote $($AllResults.Length) Songs to $($CsvOutDirectory)\CsvOut.csv"
