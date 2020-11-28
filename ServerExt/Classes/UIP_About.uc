Class UIP_About extends KFGUI_MultiComponent;

var const string ForumURL;

var KFGUI_TextField About;
var KFGUI_Button AuthorButton;
var KFGUI_Button Forumbutton;

var localized string AuthorButtonText;
var localized string AuthorButtonTooltip;
var localized string ForumButtonText;
var localized string ForumButtonTooltip;

var localized string MarcoText;
var localized string CreditsText;
var localized string ForrestMarkXText;
var localized string SheepText;
var localized string MysterialText;
var localized string PostText;
var localized string InklesspenText;
var localized string GenzmeyText;

function InitMenu()
{
	About = KFGUI_TextField(FindComponentID('About'));
	AuthorButton = KFGUI_Button(FindComponentID('Author'));
	Forumbutton = KFGUI_Button(FindComponentID('Forum'));
	
	Super.InitMenu();
	
	About.SetText("#{F3E2A9}Server Extension Mod#{DEF} - "$MarcoText$" Marco||"$CreditsText$":|#{01DF3A}Forrest Mark X#{DEF} - "$ForrestMarkXText$"|#{FF00FF}Sheep#{DEF} - "$SheepText$"|inklesspen - "$InklesspenText$"|GenZmeY - "$GenzmeyText$"|Mysterial - "$MysterialText$"|"$PostText);
	AuthorButton.ButtonText=AuthorButtonText;
	AuthorButton.Tooltip=AuthorButtonTooltip;
	Forumbutton.ButtonText=ForumButtonText;
	Forumbutton.Tooltip=ForumButtonTooltip;
}

private final function UniqueNetId GetAuthID()
{
	local UniqueNetId Res;

	class'OnlineSubsystem'.Static.StringToUniqueNetId("0x0110000100E8984E",Res);
	return Res;
}

function ButtonClicked(KFGUI_Button Sender)
{
	switch (Sender.ID)
	{
	case 'Forum':
		class'GameEngine'.static.GetOnlineSubsystem().OpenURL(ForumURL);
		break;
	case 'Author':
		OnlineSubsystemSteamworks(class'GameEngine'.static.GetOnlineSubsystem()).ShowProfileUI(0,,GetAuthID());
		break;
	}
}

defaultproperties
{
	ForumURL="https://steamcommunity.com/sharedfiles/filedetails/?id=2085786712"

	Begin Object Class=KFGUI_TextField Name=AboutText
		ID="About"
		XPosition=0.025
		YPosition=0.025
		XSize=0.95
		YSize=0.8
	End Object
	Begin Object Class=KFGUI_Button Name=AboutButton
		ID="Author"
		XPosition=0.7
		YPosition=0.92
		XSize=0.27
		YSize=0.06
		OnClickLeft=ButtonClicked
		OnClickRight=ButtonClicked
	End Object
	Begin Object Class=KFGUI_Button Name=ForumButton
		ID="Forum"
		XPosition=0.7
		YPosition=0.84
		XSize=0.27
		YSize=0.06
		OnClickLeft=ButtonClicked
		OnClickRight=ButtonClicked
	End Object
	
	Components.Add(AboutText)
	Components.Add(AboutButton)
	Components.Add(ForumButton)
}