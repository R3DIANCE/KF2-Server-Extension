Class Ext_TraitFanfire extends Ext_TraitBase;

static function TraitActivate(Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	Ext_PerkGunslinger(Perk).bHasFanfire = true;
}

static function TraitDeActivate(Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	Ext_PerkGunslinger(Perk).bHasFanfire = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkGunslinger'
	TraitGroup=class'Ext_TGroupZEDTime'
	DefLevelCosts(0)=30
}