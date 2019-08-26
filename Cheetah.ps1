##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uO1
##Nc3NCtDXTlaDjofG5iZk2X/Lb1hlWeColZOeitHsr9bItDLXRZUVTUdLwH6rUxntZvMcXPgUuO5EBE8yeqNZrLvTFIc=
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ4dI=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ4tI=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWI0g==
##OsfOAYaPHGbQvbyVvnQmqx6O
##LNzNAIWJGmPcoKHc7Do3uAu/DD1L
##LNzNAIWJGnvYv7eVvnRU7U7rVmkjDg==
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnRT4FviTXFrT9WLqvbhhLK57fzluCDKKQ==
##P8HPFJGEFzWE8p/c6DE3yF79Qwg=
##KNzDAJWHD2fS8u+Vzj184AvDV3sqDg==
##P8HSHYKDCX3N8u+Vzj184AvDV3sqDg==
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/Lx5iR76lKuY3g7fYXd+YWi1pe1/O//2w==
##L8/UAdDXTlGDjpHd5jFj5EOudDllO5fVvK6ipA==
##Kc/BRM3KXxU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba
$Server = Read-Host -Prompt 'Input Computer Name or IP Address'<# User Input#>

If (Test-NetConnection  $Server -CommonTCPPort SMB -InformationLevel Quiet) {  <#Test Computer, if it's live processed #>
Write 'Computer is alive'} else {Write 'Computer is dead'; break} 

Add-Type -AssemblyName System.Windows.Forms <# import forms assembly #>
Add-Type -AssemblyName System.Drawing <#  import forms drawing  #>


$form = New-Object System.Windows.Forms.Form  <# Creation Form#>
$form.Text = 'Please select a software or an action'
$form.Size = New-Object System.Drawing.Size(500,300) <# Design  Form width and height#>
$form.StartPosition = 'CenterScreen'<# Screen Center #>

$OKButton = New-Object System.Windows.Forms.Button <# Creation Button Design#>
$OKButton.Location = New-Object System.Drawing.Point(350,70) <# Button Location#>
$OKButton.Size = New-Object System.Drawing.Size(75,23) <# Button Size #>
$OKButton.Text = 'Deploy'<# Label Text for button #>
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK <#Action#>
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)


$CancelButton = New-Object System.Windows.Forms.Button <# Creation Button Design#>
$CancelButton.Location = New-Object System.Drawing.Point(350,100) <# Button Location#>
$CancelButton.Size = New-Object System.Drawing.Size(75,23)<# Button Size #>
$CancelButton.Text = 'Cancel'<# Label Text for button #>
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel <#Action Cancel#>
$form.CancelButton = $CancelButton <#Create button in form#>
$form.Controls.Add($CancelButton)


$About_ME = New-Object System.Windows.Forms.Button <# Creation Button Design#>
$About_ME.Location = New-Object System.Drawing.Point(350,150) <# Button Location#>
$About_ME.Size = New-Object System.Drawing.Size(75,23)<# Button Size #>
$About_ME.Text = 'Author'<# Label Text for button #>
$About_ME.add_Click({[system.Diagnostics.Process]::start("https://www.linkedin.com/in/mikemusa/")}) 
$form.Controls.Add($About_ME)

$label = New-Object System.Windows.Forms.Label <# Creation form label #>
$label.Location = New-Object System.Drawing.Point(10,20) <# Label location#>
$label.Size = New-Object System.Drawing.Size(280,20)<# label size#>
$label.Text = 'Cheetah V1.5 by Mike Musa:'<# Label text #>
$form.Controls.Add($label) 



$listBox = New-Object System.Windows.Forms.ListBox <# Create listbox #>
$listBox.Location = New-Object System.Drawing.Point(10,40) <# listbox location #>
$listBox.Size = New-Object System.Drawing.Size(300,40) <# listbox size #>
$listBox.Height = 200<# listbox height #>

<# List of items #>
[void] $listBox.Items.Add('Restart Computer')
[void] $listBox.Items.Add('Shutdown Computer')
[void] $listBox.Items.Add('7-ZIP 2019')
[void] $listBox.Items.Add('Adobe Reader 2019')
[void] $listBox.Items.Add('VLC 2019')
[void] $listBox.Items.Add('SilverLight 2019')
[void] $listBox.Items.Add('Horizon POS 2019')
[void] $listBox.Items.Add('GP 2018')
[void] $listBox.Items.Add('Windows Update 1809')
[void] $listBox.Items.Add('Java Update 2019')
[void] $listBox.Items.Add('iTunes 2019')
[void] $listBox.Items.Add('Meadco Script-PCC addon')
[void] $listBox.Items.Add('I25-Fix Badge barcode')
[void] $listBox.Items.Add('AlwaysOnVPN')
<# List of items #>

$form.Controls.Add($listBox)

$form.Topmost = $true

$result = $form.ShowDialog()





if ($result -eq [System.Windows.Forms.DialogResult]::OK) <# If you select item and click okay the value stored in x#>
{
    $x = $listBox.SelectedItem
    $x
    
}

if ($result -eq [System.Windows.Forms.DialogResult]::Cancel) <#cancel#>
{
  break
    
}





if ($x.Equals('Restart Computer')){ <#Restart computer if it has been selected#>


Restart-Computer -ComputerName "$Server" -Force
Clear
Write-Host "The" $Server "has been sucessfully restarted"  
pause

}


if ($x.Equals('Shutdown Computer')){<#Shutdown computer if it has been selected#>


Stop-Computer -ComputerName "$Server" -Force
Clear
Write-Host "The" $Server "has been sucessfully Shutdown"  
pause
}


if ($x.Equals('7-ZIP 2019')){ <#Install 7-ZIP or update it if it has been selected#>


#Location of PsExec                           #Server=Workstation  # Command you want to run as an admin 

\\NetworkPath\E\Apps\PSTools\PsExec.exe -i -s -d \\$Server cmd /c start /min  \\NetworkPath\E\Apps\7z\7z.bat #Batch script

Clear

Write-Host "The" $x "has been sucessfully deployed to" $Server 
pause


}


if ($x.Equals('Adobe Reader 2019')){ <#Install Adobe or update it if it has been selected#>




\\NetworkPath\E\Apps\PSTools\PsExec.exe -i -s -d \\$Server cmd /c start /min  \\NetworkPath\E\Apps\adobe\adobe.bat

Clear

Write-Host "The" $x "has been sucessfully deployed to" $Server 
pause
}

if ($x.Equals('VLC 2019')){ <#Install VLC or update it if it has been selected#>




\\NetworkPath\E\Apps\PSTools\PsExec.exe -i -s -d \\$Server cmd /c start /min  \\NetworkPath\E\Apps\vlc\vlc.bat

Clear

Write-Host "The" $x "has been sucessfully deployed to" $Server 
pause
}

if ($x.Equals('SilverLight 2019')){ <#Install Silverlight or update it if it has been selected#>


\\NetworkPath\E\Apps\PSTools\PsExec.exe -i -s -d \\$Server cmd /c start /min  \\NetworkPath\E\Apps\silver\silver.bat
Clear

Write-Host "The" $x "has been sucessfully deployed to" $Server 
pause
}

if ($x.Equals('Horizon POS 2019')){ <#Install POS or update it if it has been selected#>




\\NetworkPath\E\Apps\PSTools\PsExec.exe -i -s -d \\$Server cmd /c start /min \\NetworkPath\E\Apps\POS\Install.bat
Clear

Write-Host "The" $x "has been sucessfully deployed to" $Server 
pause
}

if ($x.Equals('GP 2018')){ <#Install GP18 or update it if it has been selected#>




\\NetworkPath\E\Apps\PSTools\PsExec.exe -i -s -d \\$Server cmd /c start /min  \\NetworkPath\E\Apps\GP\install.bat

clear

Write-Host "The" $x "has been sucessfully deployed to" $Server 
pause
}

if ($x.Equals('Windows Update 1809')){ <#Install Windows Update or update it if it has been selected#>




\\NetworkPath\E\Apps\PSTools\PsExec.exe -i -s -d \\$Server cmd /c start /min  \\NetworkPath\E\Apps\Windows\Windows\update.bat

clear

Write-Host "The" $x "has been sucessfully deployed to" $Server 
pause
}

if ($x.Equals('Java Update 2019')){ <#Install Java Update or update it if it has been selected#>




\\NetworkPath\E\Apps\PSTools\PsExec.exe -i -s -d \\$Server cmd /c start /min  \\NetworkPath\E\Apps\Java\java.bat

clear

Write-Host "The" $x "has been sucessfully deployed to" $Server
pause 
}

if ($x.Equals('iTunes 2019')){ <#Install iTunes Update or update it if it has been selected#>




\\NetworkPath\E\Apps\PSTools\PsExec.exe -i -s -d \\$Server cmd /c start /min  \\NetworkPath\E\Apps\iTunes\itunes.bat

clear

Write-Host "The" $x "has been sucessfully deployed to" $Server 
pause
}

if ($x.Equals('Meadco Script-PCC addon')){ <#Install Meadco Script Update or update it if it has been selected#>




\\NetworkPath\E\Apps\PSTools\PsExec.exe -i -s -d \\$Server cmd /c start /min  \\NetworkPath\E\Apps\Meadco-PCC\Meadco.bat

clear

Write-Host "The" $x "has been sucessfully deployed to" $Server 
pause
}

if ($x.Equals('I25-Fix Badge barcode')){ <#Install I25-Fix Badge barcode Update or update it if it has been selected#>




\\NetworkPath\E\Apps\PSTools\PsExec.exe -i -s -d \\$Server cmd /c start /min  \\NetworkPath\E\Apps\i25\i25.bat

clear

Write-Host "The" $x "has been sucessfully deployed to" $Server 
pause
}

if ($x.Equals('AlwaysOnVPN')){ <#Install AlwaysOnVPN Update or update it if it has been selected#>


XCOPY '\\NetworkPath\E$\Apps\vpn' \\$Server\C$\vpn /s /i /Y




\\NetworkPath\E\Apps\PSTools\PsExec.exe -i -s -d \\$Server cmd /c start /min  \\$Server\C$\vpn\vpn.bat

clear

Write-Host "The" $x "has been sucessfully deployed to" $Server 
pause
}
