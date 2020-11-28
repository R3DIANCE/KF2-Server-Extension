Class Ext_TraitDuracell extends Ext_TraitBase;

var array<float> BatteryCharges;

static function ApplyEffectOn(KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	if (ExtHumanPawn(Player)!=None)
		ExtHumanPawn(Player).SetBatteryRate(Default.BatteryCharges[Level-1]);
}
static function CancelEffectOn(KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	if (ExtHumanPawn(Player)!=None)
		ExtHumanPawn(Player).SetBatteryRate(1.f);
}

defaultproperties
{
	NumLevels=4
	DefLevelCosts(0)=5
	DefLevelCosts(1)=10
	DefLevelCosts(2)=20
	DefLevelCosts(3)=25
	BatteryCharges.Add(0.77)
	BatteryCharges.Add(0.5)
	BatteryCharges.Add(0.333)
	BatteryCharges.Add(0.1)
}