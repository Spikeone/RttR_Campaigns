$bytes  = [System.IO.File]::ReadAllBytes("C:\Users\<User>\Desktop\S2DS\ExtractMaps\fat_data.bin")
#Write-Host "Data: "($bytes.Count)
$maps = @{}

function isMapHeader($offSet)
{
    if($bytes[$offSet + 1] -ne 0x4F)
    {
        return $False;
    }

    if ($bytes[$offSet + 2] -ne 0x52)
    {
        return $False;
    }

    if ($bytes[$offSet + 3] -ne 0x4C)
    {
        return $False;
    }

    if ($bytes[$offSet + 4] -ne 0x44)
    {
        return $False;
    }

    if ($bytes[$offSet + 5] -ne 0x5F)
    {
        return $False;
    }

    if ($bytes[$offSet + 6] -ne 0x56)
    {
        return $False;
    }

    if ($bytes[$offSet + 7] -ne 0x31)
    {
        return $False;
    }

    if ($bytes[$offSet + 8] -ne 0x2E)
    {
        return $False;
    }

    if ($bytes[$offSet + 9] -ne 0x30)
    {
        return $False;
    }

    return $True;
}

for($i = 0; $i -lt $bytes.Count; $i++)
{

    if($bytes[$i] -eq 0x57)
    {
        if(isMapHeader $i)
        {
            $mapCounter = $maps.Count
            $maps[$mapCounter] = @{}

            #Write-Host "Map at $i"
            # Warning: Mapsize in the mapheader is sometimes wrong (e.g. 0) resulting in wrong offsets, the block headers on the other hand are always correct
            #Write-Host "Width1: "($bytes[$i + 30]) "Width2: "($bytes[$i + 2348])
            #Write-Host "Height2: "($bytes[$i + 32]) "Height2: "($bytes[$i + 2350])

            $maps[$mapCounter].Start = $i
            $maps[$mapCounter].End = $i + 2352 + 14 * 16 + 14 * ($bytes[$i + 2348]) * ($bytes[$i + 2350])

            $i = $maps[$mapCounter].End
        }
    }
}

for($m = 0; $m -lt $maps.Count; $m++)
{
    #Write-Host "Map from: " ($maps[$m].Start) " to " ($maps[$m].End)
    [System.IO.File]::WriteAllBytes(("C:\Users\<User>\Desktop\S2DS\ExtractMaps\" + $m.ToString() + ".wld"), $bytes[($maps[$m].Start)..($maps[$m].End)]);
}