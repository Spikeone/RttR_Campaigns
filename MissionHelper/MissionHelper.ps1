[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Windows.Forms.Application]::EnableVisualStyles()

$global:FormSizeX = 1280
$global:FormSizeY = 1024

$animalConsts = @{}
$animalConsts[0] = "SPEC_POLARBEAR"
$animalConsts[1] = "SPEC_RABBITWHITE"
$animalConsts[2] = "SPEC_RABBITGREY"
$animalConsts[3] = "SPEC_FOX"
$animalConsts[4] = "SPEC_STAG"
$animalConsts[5] = "SPEC_DEER"
$animalConsts[6] = "SPEC_DUCK"
$animalConsts[7] = "SPEC_SHEEP"
$animalConsts[8] = "SPEC_SHEEP"

$goodsConsts = @{}
$goodsConsts[0] = "GD_WOOD"
$goodsConsts[1] = "GD_BOARDS"
$goodsConsts[2] = "GD_STONES"
$goodsConsts[3] = "GD_HAM"
$goodsConsts[4] = "GD_GRAIN"
$goodsConsts[5] = "GD_FLOUR"
$goodsConsts[6] = "GD_FISH"
$goodsConsts[7] = "GD_MEAT"
$goodsConsts[8] = "GD_BREAD"
$goodsConsts[9] = "GD_WATER"
$goodsConsts[10] = "GD_BEER"
$goodsConsts[11] = "GD_COAL"
$goodsConsts[12] = "GD_IRONORE"
$goodsConsts[13] = "GD_GOLD"
$goodsConsts[14] = "GD_IRON"
$goodsConsts[15] = "GD_COINS"
$goodsConsts[16] = "GD_TONGS"
$goodsConsts[17] = "GD_AXE"
$goodsConsts[18] = "GD_SAW"
$goodsConsts[19] = "GD_PICKAXE"
$goodsConsts[20] = "GD_HAMMER"
$goodsConsts[21] = "GD_SHOVEL"
$goodsConsts[22] = "GD_CRUCIBLE"
$goodsConsts[23] = "GD_RODANDLINE"
$goodsConsts[24] = "GD_SCYTHE"
$goodsConsts[25] = "GD_CLEAVER"
$goodsConsts[26] = "GD_ROLLINGPIN"
$goodsConsts[27] = "GD_BOW"
$goodsConsts[28] = "GD_SWORD"
$goodsConsts[29] = "GD_SHIELD"
$goodsConsts[30] = "GD_BOAT"

$peopleConsts = @{}
$peopleConsts[0] = "JOB_HELPER"
$peopleConsts[1] = "JOB_WOODCUTTER"
$peopleConsts[2] = "JOB_FISHER"
$peopleConsts[3] = "JOB_FORESTER"
$peopleConsts[4] = "JOB_CARPENTER"
$peopleConsts[5] = "JOB_STONEMASON"
$peopleConsts[6] = "JOB_HUNTER"
$peopleConsts[7] = "JOB_FARMER"
$peopleConsts[8] = "JOB_MILLER"
$peopleConsts[9] = "JOB_BAKER"
$peopleConsts[10] = "JOB_BUTCHER"
$peopleConsts[11] = "JOB_MINER"
$peopleConsts[12] = "JOB_BREWER"
$peopleConsts[13] = "JOB_PIGBREEDER"
$peopleConsts[14] = "JOB_DONKEYBREEDER"
$peopleConsts[15] = "JOB_IRONFOUNDER"
$peopleConsts[16] = "JOB_MINTER"
$peopleConsts[17] = "JOB_METALWORKER"
$peopleConsts[18] = "JOB_ARMORER"
$peopleConsts[19] = "JOB_BUILDER"
$peopleConsts[20] = "JOB_PLANER"
$peopleConsts[21] = "JOB_GEOLOGIST"
$peopleConsts[22] = "JOB_PRIVATE"
$peopleConsts[23] = "JOB_PRIVATEFIRSTCLASS"
$peopleConsts[24] = "JOB_SERGEANT"
$peopleConsts[25] = "JOB_OFFICER"
$peopleConsts[26] = "JOB_GENERAL"
$peopleConsts[27] = "JOB_SCOUT"
$peopleConsts[28] = "JOB_SHIPWRIGHT"
$peopleConsts[29] = "JOB_PACKDONKEY"


$objForm                = New-Object System.Windows.Forms.Form 
$objForm.Size           = New-Object System.Drawing.Size($global:FormSizeX, $global:FormSizeY)
$objForm.minimumSize    = New-Object System.Drawing.Size($global:FormSizeX, $global:FormSizeY)
$objForm.maximumSize    = New-Object System.Drawing.Size($global:FormSizeX, $global:FormSizeY)
$objForm.Text = "Mission Helper by Spike"

$btnMain_Animal = New-Object System.Windows.Forms.Button
$btnMain_Animal.Location = New-Object System.Drawing.Size((($global:FormSizeX - 512) / 2),8)
$btnMain_Animal.Size = New-Object System.Drawing.Size(512,32)
$btnMain_Animal.Text = "!ADD_ANIMAL -> RttR"
$btnMain_Animal.Add_Click({Animal_SetControls $False; Main_SetControls $True})
$btnMain_Animal.Font = New-Object System.Drawing.Font("Lucida Console", 16)
$objForm.Controls.Add($btnMain_Animal)

$btnMain_TextFormat = New-Object System.Windows.Forms.Button
$btnMain_TextFormat.Location = New-Object System.Drawing.Size((($global:FormSizeX - 512) / 2), (8 + 1 * 16 + 1 * 32))
$btnMain_TextFormat.Size = New-Object System.Drawing.Size(512,32)
$btnMain_TextFormat.Text = "Mission Text Linebreaks"
$btnMain_TextFormat.Add_Click({MissionText_SetControls $False; Main_SetControls $True})
$btnMain_TextFormat.Font = New-Object System.Drawing.Font("Lucida Console", 16)
$objForm.Controls.Add($btnMain_TextFormat)

$btnMain_Ware = New-Object System.Windows.Forms.Button
$btnMain_Ware.Location = New-Object System.Drawing.Size((($global:FormSizeX - 512) / 2), (8 + 2 * 16 + 2 * 32))
$btnMain_Ware.Size = New-Object System.Drawing.Size(512,32)
$btnMain_Ware.Text = "!ADD_WARE -> RttR"
$btnMain_Ware.Add_Click({Ware_SetControls $False; Main_SetControls $True})
$btnMain_Ware.Font = New-Object System.Drawing.Font("Lucida Console", 16)
$objForm.Controls.Add($btnMain_Ware)

$btnMain_People = New-Object System.Windows.Forms.Button
$btnMain_People.Location = New-Object System.Drawing.Size((($global:FormSizeX - 512) / 2), (8 + 3 * 16 + 3 * 32))
$btnMain_People.Size = New-Object System.Drawing.Size(512,32)
$btnMain_People.Text = "!ADD_PEOPLE -> RttR"
$btnMain_People.Add_Click({People_SetControls $False; Main_SetControls $True})
$btnMain_People.Font = New-Object System.Drawing.Font("Lucida Console", 16)
$objForm.Controls.Add($btnMain_People)

function Main_SetControls($hide)
{
    if($hide)
    {
        $btnMain_Animal.Hide()
        $btnMain_TextFormat.Hide()
        $btnMain_Ware.Hide()
        $btnMain_People.Hide()
    }
    else
    {
        $btnMain_Animal.Show()
        $btnMain_TextFormat.Show()
        $btnMain_Ware.Show()
        $btnMain_People.Show()
    }
}

# animal setting
$txfText_Animal = New-Object System.Windows.Forms.RichTextBox
$txfText_Animal.Location = New-Object System.Drawing.Size(8,8)
$txfText_Animal.Size = New-Object System.Drawing.Size(($global:FormSizeX - 16 - 16),($global:FormSizeY - 48 - 52 - $global:FormSizeY / 2))
$txfText_Animal.Font = New-Object System.Drawing.Font("Lucida Console",10)
$txfText_Animal.Text = "!ADD_ANIMAL   6     2    126  48"
$txfText_Animal.MultiLine = $True
$txfText_Animal.Add_TextChanged({AnimalTextboxChanged})
$objForm.Controls.Add($txfText_Animal)

$txfText_AnimalOut = New-Object System.Windows.Forms.RichTextBox
$txfText_AnimalOut.Location = New-Object System.Drawing.Size(8, (($global:FormSizeY / 2) - 48 - 52 + 8))
$txfText_AnimalOut.Size = New-Object System.Drawing.Size(($global:FormSizeX - 16 - 16),($global:FormSizeY - 48 - 52 - $global:FormSizeY / 2))
$txfText_AnimalOut.Font = New-Object System.Drawing.Font("Lucida Console",10)
$txfText_AnimalOut.Text = "rttr:GetWorld():AddAnimal( 126,  48, SPEC_DUCK)"
$txfText_AnimalOut.MultiLine = $True
$txfText_AnimalOut.ReadOnly = $True
$objForm.Controls.Add($txfText_AnimalOut)

$btnBack_Animal = New-Object System.Windows.Forms.Button
$btnBack_Animal.Location = New-Object System.Drawing.Size(8,($global:FormSizeY - 48 - 32))
$btnBack_Animal.Size = New-Object System.Drawing.Size(256,32)
$btnBack_Animal.Text = "Back"
$btnBack_Animal.Add_Click({Animal_SetControls $True; Main_SetControls $False})
$btnBack_Animal.Font = New-Object System.Drawing.Font("Lucida Console", 16)
$objForm.Controls.Add($btnBack_Animal)

function Animal_SetControls($hide)
{
    if($hide)
    {
        $txfText_Animal.Hide()
        $txfText_AnimalOut.Hide()
        $btnBack_Animal.Hide()
    }
    else
    {
        $txfText_Animal.Show()
        $txfText_AnimalOut.Show()
        $btnBack_Animal.Show()
    }
}

Animal_SetControls $True

function AnimalTextboxChanged()
{
    $txfText_AnimalOut.Text = ""

    for($i = 0; $i -lt $txfText_Animal.Lines.Count; $i++)
    {
        $reg = "[\s\t]*!ADD_ANIMAL[\s\t]*([\d]+)[\s\t]*([\d]+)[\s\t]*([\d]+)[\s\t]*([\d]+)[\s\t]*"
        $found = $txfText_Animal.Lines[$i] -match $reg

        if($found)
        {
            $strText = "rttr:GetWorld():AddAnimal(" + $matches[3].PadLeft(4," ") + "," + $matches[4].PadLeft(4," ") + ", " + $animalConsts[([int]$matches[1])] + ")"

            for($j = 0; $j -lt ([int]$matches[2]); $j++)
            {
                if($txfText_AnimalOut.Text -ne "")
                {
                    $txfText_AnimalOut.AppendText("`n")
                }

                $txfText_AnimalOut.AppendText($strText);
            }
        }
        elseif($txfText_Animal.Lines[$i] -eq "")
        {
            $txfText_AnimalOut.AppendText("`n")
        }
        else
        {
            if($txfText_AnimalOut.Text -ne "")
            {
                $txfText_AnimalOut.AppendText("`n")
            }

            $txfText_AnimalOut.AppendText(("-- " + $txfText_Animal.Lines[$i]));
        }

    }
}

# mission text formatting
$txfText_MissionText = New-Object System.Windows.Forms.TextBox
$txfText_MissionText.Location = New-Object System.Drawing.Size(8,8)
$txfText_MissionText.Size = New-Object System.Drawing.Size(($global:FormSizeX - 16 - 16),16)
$txfText_MissionText.Font = New-Object System.Drawing.Font("Lucida Console",10)
$txfText_MissionText.Text = "Rock carvings suggest there is an island in the southwest. It appears there are large gold deposits there."
#$txfText_MissionText.MultiLine = $True
$txfText_MissionText.Add_TextChanged({MissionText_FormatInput})
$objForm.Controls.Add($txfText_MissionText)

$txfText_MissionTextOut = New-Object System.Windows.Forms.TextBox
$txfText_MissionTextOut.Location = New-Object System.Drawing.Size(8,32)
$txfText_MissionTextOut.Size = New-Object System.Drawing.Size(($global:FormSizeX - 16 - 16),16)
$txfText_MissionTextOut.Font = New-Object System.Drawing.Font("Lucida Console",10)
$txfText_MissionTextOut.Text = "Rock carvings suggest there is an island in the southwest. It appears there are large gold deposits there."
$txfText_MissionTextOut.Add_TextChanged({MissionText_FormatInput})
$objForm.Controls.Add($txfText_MissionTextOut)

$btnBack_MissionText = New-Object System.Windows.Forms.Button
$btnBack_MissionText.Location = New-Object System.Drawing.Size(8,($global:FormSizeY - 48 - 32))
$btnBack_MissionText.Size = New-Object System.Drawing.Size(256,32)
$btnBack_MissionText.Text = "Back"
$btnBack_MissionText.Add_Click({MissionText_SetControls $True; Main_SetControls $False})
$btnBack_MissionText.Font = New-Object System.Drawing.Font("Lucida Console", 16)
$objForm.Controls.Add($btnBack_MissionText)

function MissionText_FormatInput()
{
    $strInput = $txfText_MissionText.Text
    $strOutput = ""

    # either this is by char width (real) or charcount

    $byCount = $True

    if($byCount)
    {
        # 1 - Split words by space
        $arrInput = $strInput.Split(" ")
        $charCount = 0
        #Write-Host "InputWords: " $arrInput.Count
        for($i = 0; $i -lt $arrInput.Count; $i++)
        {
            #Write-Host "$i : " + $arrInput[$i]
            
            if($arrInput[$i].Replace("@", "") -eq "")
            {
                for($j = 0; $j -lt ([int]($arrInput[$i].Length / 2)); $j++)
                {
                    $strOutput = $strOutput + "\n"
                }

                $charCount = 0
            }
            elseif($charCount + $arrInput[$i].Length -gt 52)
            {
                $strOutput = $strOutput + "\n" + $arrInput[$i]
                $charCount = 0
            }
            else
            {
                if($strOutput -eq "")
                {
                    $strOutput = $arrInput[$i]
                }
                else
                {
                    $strOutput = $strOutput + " " + $arrInput[$i]
                    $charCount = $charCount + 1
                }
            }

            $charCount = $charCount + $arrInput[$i].Length
        }

        $txfText_MissionTextOut.Text = $strOutput
    }
    else
    {
        # not implemented
    }
}

function MissionText_SetControls($hide)
{
    if($hide)
    {
        $txfText_MissionText.Hide()
        $btnBack_MissionText.Hide()
        $txfText_MissionTextOut.Hide()
    }
    else
    {
        $txfText_MissionText.Show()
        $btnBack_MissionText.Show()
        $txfText_MissionTextOut.Show()
    }
}

MissionText_SetControls $True

# ware setting
$txfText_Ware = New-Object System.Windows.Forms.RichTextBox
$txfText_Ware.Location = New-Object System.Drawing.Size(8,8)
$txfText_Ware.Size = New-Object System.Drawing.Size(($global:FormSizeX - 16 - 16),($global:FormSizeY - 48 - 52 - $global:FormSizeY / 2))
$txfText_Ware.Font = New-Object System.Drawing.Font("Lucida Console",10)
$txfText_Ware.Text = "!ADD_WARE 0   24"
$txfText_Ware.MultiLine = $True
$txfText_Ware.Add_TextChanged({WareTextboxChanged})
$objForm.Controls.Add($txfText_Ware)

$txfText_WareOut = New-Object System.Windows.Forms.RichTextBox
$txfText_WareOut.Location = New-Object System.Drawing.Size(8, (($global:FormSizeY / 2) - 48 - 52 + 8))
$txfText_WareOut.Size = New-Object System.Drawing.Size(($global:FormSizeX - 16 - 16),($global:FormSizeY - 48 - 52 - $global:FormSizeY / 2))
$txfText_WareOut.Font = New-Object System.Drawing.Font("Lucida Console",10)
$txfText_WareOut.Text = "[GD_WOOD      ] = 24,"
$txfText_WareOut.MultiLine = $True
$txfText_WareOut.ReadOnly = $True
$objForm.Controls.Add($txfText_WareOut)

$btnBack_Ware = New-Object System.Windows.Forms.Button
$btnBack_Ware.Location = New-Object System.Drawing.Size(8,($global:FormSizeY - 48 - 32))
$btnBack_Ware.Size = New-Object System.Drawing.Size(256,32)
$btnBack_Ware.Text = "Back"
$btnBack_Ware.Add_Click({Ware_SetControls $True; Main_SetControls $False})
$btnBack_Ware.Font = New-Object System.Drawing.Font("Lucida Console", 16)
$objForm.Controls.Add($btnBack_Ware)

function Ware_SetControls($hide)
{
    if($hide)
    {
        $txfText_Ware.Hide()
        $txfText_WareOut.Hide()
        $btnBack_Ware.Hide()
    }
    else
    {
        $txfText_Ware.Show()
        $txfText_WareOut.Show()
        $btnBack_Ware.Show()
    }
}

Ware_SetControls $True

function WareTextboxChanged()
{
    $txfText_WareOut.Text = ""

    for($i = 0; $i -lt $txfText_Ware.Lines.Count; $i++)
    {
        $reg = "[\s\t]*!ADD_WARE[\s\t]*([\d]+)[\s\t]*([\d]+)[\s\t]*"
        $found = $txfText_Ware.Lines[$i] -match $reg

        if($found)
        {
            $strText = "[" + $goodsConsts[([int]$matches[1])].PadRight(13, " ") + "] = " + $matches[2] + ","

            if($txfText_WareOut.Text -ne "")
            {
                $txfText_WareOut.AppendText("`n")
            }

            $txfText_WareOut.AppendText($strText);
        }
        elseif($txfText_Ware.Lines[$i] -eq "")
        {
            $txfText_WareOut.AppendText("`n")
        }
        else
        {
            if($txfText_WareOut.Text -ne "")
            {
                $txfText_WareOut.AppendText("`n")
            }

            $txfText_WareOut.AppendText(("-- " + $txfText_Ware.Lines[$i]));
        }

    }
}

# ware setting
$txfText_People = New-Object System.Windows.Forms.RichTextBox
$txfText_People.Location = New-Object System.Drawing.Size(8,8)
$txfText_People.Size = New-Object System.Drawing.Size(($global:FormSizeX - 16 - 16),($global:FormSizeY - 48 - 52 - $global:FormSizeY / 2))
$txfText_People.Font = New-Object System.Drawing.Font("Lucida Console",10)
$txfText_People.Text = "!ADD_PEOPLE 0   52"
$txfText_People.MultiLine = $True
$txfText_People.Add_TextChanged({PeopleTextboxChanged})
$objForm.Controls.Add($txfText_People)

$txfText_PeopleOut = New-Object System.Windows.Forms.RichTextBox
$txfText_PeopleOut.Location = New-Object System.Drawing.Size(8, (($global:FormSizeY / 2) - 48 - 52 + 8))
$txfText_PeopleOut.Size = New-Object System.Drawing.Size(($global:FormSizeX - 16 - 16),($global:FormSizeY - 48 - 52 - $global:FormSizeY / 2))
$txfText_PeopleOut.Font = New-Object System.Drawing.Font("Lucida Console",10)
$txfText_PeopleOut.Text = "[JOB_HELPER           ] = 52,"
$txfText_PeopleOut.MultiLine = $True
$txfText_PeopleOut.ReadOnly = $True
$objForm.Controls.Add($txfText_PeopleOut)

$btnBack_People = New-Object System.Windows.Forms.Button
$btnBack_People.Location = New-Object System.Drawing.Size(8,($global:FormSizeY - 48 - 32))
$btnBack_People.Size = New-Object System.Drawing.Size(256,32)
$btnBack_People.Text = "Back"
$btnBack_People.Add_Click({People_SetControls $True; Main_SetControls $False})
$btnBack_People.Font = New-Object System.Drawing.Font("Lucida Console", 16)
$objForm.Controls.Add($btnBack_People)

function People_SetControls($hide)
{
    if($hide)
    {
        $txfText_People.Hide()
        $txfText_PeopleOut.Hide()
        $btnBack_People.Hide()
    }
    else
    {
        $txfText_People.Show()
        $txfText_PeopleOut.Show()
        $btnBack_People.Show()
    }
}

People_SetControls $True

function PeopleTextboxChanged()
{
    $txfText_PeopleOut.Text = ""

    for($i = 0; $i -lt $txfText_People.Lines.Count; $i++)
    {
        $reg = "[\s\t]*!ADD_PEOPLE[\s\t]*([\d]+)[\s\t]*([\d]+)[\s\t]*"
        $found = $txfText_People.Lines[$i] -match $reg

        if($found)
        {
            $strText = "[" + $peopleConsts[([int]$matches[1])].PadRight(21, " ") + "] = " + $matches[2] + ","

            if($txfText_PeopleOut.Text -ne "")
            {
                $txfText_PeopleOut.AppendText("`n")
            }

            $txfText_PeopleOut.AppendText($strText);
        }
        elseif($txfText_People.Lines[$i] -eq "")
        {
            $txfText_PeopleOut.AppendText("`n")
        }
        else
        {
            if($txfText_PeopleOut.Text -ne "")
            {
                $txfText_PeopleOut.AppendText("`n")
            }

            $txfText_PeopleOut.AppendText(("-- " + $txfText_People.Lines[$i]));
        }

    }
}

#function AppendText($txf, $text)
#{
#    $start = $txf.TextLength;
#    $outputBox.AppendText($text);
#    $end = $outputBox.TextLength;
#    
#    $outputBox.Select($start, ($end - $start))
#    $outputBox.SelectionColor = $clr
#    $outputBox.SelectionLength = 0
#}

[void] $objForm.ShowDialog()

