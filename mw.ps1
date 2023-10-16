#CIGARETTE LIZARD

invoke-WebRequest -Uri 'https://github.com/omegasega/MagicWord2/raw/main/mw.mp4' -OutFile c:\mw\'mw.mp4'

invoke-WebRequest -Uri 'https://github.com/omegasega/MagicWord2/raw/main/mw2.ps1' -OutFile c:\mw\'mw2.ps1'

#WPF Library for Playing Movie and some components
Add-Type -AssemblyName PresentationFramework

Add-Type -AssemblyName System.ComponentModel
#XAML File of WPF as windows for playing movie

[xml]$XAML = @"
 
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="YOU DIDNT SAY THE MAGIC WORD" WindowState="Maximized" ResizeMode="NoResize" WindowStartupLocation="CenterScreen" >
        <MediaElement Stretch="Fill" Name="VideoPlayer" LoadedBehavior="Manual" UnloadedBehavior="Stop"  />
</Window>
"@
 
#Movie Path CIGARETTE LIZARD mw
[uri]$VideoSource = "C:\mw\mw.mp4"
 
#Devide All Objects on XAML
$XAMLReader=(New-Object System.Xml.XmlNodeReader $XAML)
$Window=[Windows.Markup.XamlReader]::Load( $XAMLReader )
$VideoPlayer = $Window.FindName("VideoPlayer")

 
#Video Default Setting
$VideoPlayer.Volume = 100;
$VideoPlayer.Source = $VideoSource;
#$VideoPlayer.Padding = new Thickness(5);



$VideoPlayer.Play()
 
#Show Up the Window 
$Window.ShowDialog() | out-null



