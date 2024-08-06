// based on quake1randomizer's

// MONSTERS
void() ConvertToFiend;
void() ConvertToDog;
void() ConvertToEnforcer;
void() ConvertToRotfish;
void() ConvertToDeathKnight;
void() ConvertToKnight;
void() ConvertToOgre;
void() ConvertToVore;
void() ConvertToShambler;
void() ConvertToGrunt;
void() ConvertToSpawn;
void() ConvertToScrag;
void() ConvertToZombie;
// PICKUPS
void() ConvertToHealth;
// AMMO
void() ConvertToShells;
void() ConvertToNails;
void() ConvertToRockets;
void() ConvertToCells;

.float QualityType;				// Which quality of health, armor or ammo pickup it is

// START MONSTERS

// Replaces entity with a Fiend
void() ConvertToFiend =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");

	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/demon.mdl");

	setsize (self, VEC_HULL2_MIN, VEC_HULL2_MAX);
	if (self.flags & FL_FLY)
		self.flags = self.flags - (self.flags & FL_FLY);
	if (self.flags & FL_SWIM)
		self.flags = self.flags - (self.flags & FL_SWIM);
	if (self.spawnflags & SPAWN_CRUCIFIED)
		self.spawnflags = self.spawnflags - (self.spawnflags & SPAWN_CRUCIFIED);
	self.health = 300;
	self.classname = "monster_demon1";
	self.frame = $stand1;
	self.th_stand = demon1_stand1;
	self.th_walk = demon1_walk1;
	self.th_run = demon1_run1;
	self.th_die = demon_die;
	self.th_melee = Demon_MeleeAttack;// one of two attacks
	self.th_missile = demon1_jump1;// jump attack
	self.th_pain = demon1_pain;
	dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";
	walkmonster_start();
};

// Replaces entity with a Dog
void() ConvertToDog =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");

	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/dog.mdl");

	setsize (self, '-32 -32 -24', '32 32 40');
	if (self.flags & FL_FLY)
		self.flags = self.flags - (self.flags & FL_FLY);
	if (self.flags & FL_SWIM)
		self.flags = self.flags - (self.flags & FL_SWIM);
	if (self.spawnflags & SPAWN_CRUCIFIED)
		self.spawnflags = self.spawnflags - (self.spawnflags & SPAWN_CRUCIFIED);
	self.health = 25;
	self.classname = "monster_dog";
	self.frame = $stand1;
	self.th_stand = dog_stand1;
	self.th_walk = dog_walk1;
	self.th_run = dog_run1;
	self.th_pain = dog_pain;
	self.th_die = dog_die;
	self.th_melee = dog_atta1;
	self.th_missile = dog_leap1;

	dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";
	walkmonster_start();
};

void() ConvertToEnforcer =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");
	
	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/enforcer.mdl");

	setsize (self, '-16 -16 -24', '16 16 40');
	if (self.flags & FL_FLY)
		self.flags = self.flags - (self.flags & FL_FLY);
	if (self.flags & FL_SWIM)
		self.flags = self.flags - (self.flags & FL_SWIM);
	if (self.spawnflags & SPAWN_CRUCIFIED)
		self.spawnflags = self.spawnflags - (self.spawnflags & SPAWN_CRUCIFIED);
	self.health = 80;
	self.classname = "monster_enforcer";
	self.frame = $stand1;
	self.th_stand = enf_stand1;
	self.th_walk = enf_walk1;
	self.th_run = enf_run1;
	self.th_pain = enf_pain;
	self.th_die = enf_die;
	self.th_missile = enf_atk1;
	self.th_melee = enf_atk1;

	dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";

	walkmonster_start();
};

// Replaces entity with a Rotfish
void() ConvertToRotfish =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");

	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/fish.mdl");

	setsize (self, '-16 -16 -24', '16 16 24');
	if (self.flags & FL_FLY)
		self.flags = self.flags - (self.flags & FL_FLY);
	if (!(self.flags & FL_SWIM))
		self.flags = self.flags | FL_SWIM;
	if (self.spawnflags & SPAWN_CRUCIFIED)
		self.spawnflags = self.spawnflags - (self.spawnflags & SPAWN_CRUCIFIED);
	self.health = 25;
	self.classname = "monster_fish";
	self.frame = $stand1;
	self.th_stand = f_stand1;
	self.th_walk = f_walk1;
	self.th_run = f_run1;
	self.th_die = f_death1;
	self.th_pain = fish_pain;
	self.th_melee = f_attack1;
	self.th_missile = SUB_Null;
	
	dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";

	swimmonster_start ();
};

// Replaces entity with a Death Knight
void() ConvertToDeathKnight =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");
	
	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/hknight.mdl");

	setsize (self, '-16 -16 -24', '16 16 40');
	if (self.flags & FL_FLY)
		self.flags = self.flags - (self.flags & FL_FLY);
	if (self.flags & FL_SWIM)
		self.flags = self.flags - (self.flags & FL_SWIM);
	if (self.spawnflags & SPAWN_CRUCIFIED)
		self.spawnflags = self.spawnflags - (self.spawnflags & SPAWN_CRUCIFIED);
	self.health = 250;
	self.classname = "monster_hell_knight";
	self.frame = $stand1;
	self.th_stand = hknight_stand1;
	self.th_walk = hknight_walk1;
	self.th_run = hknight_run1;
	self.th_melee = hknight_melee;
	self.th_missile = hknight_magicc1;
	self.th_pain = hknight_pain;
	self.th_die = hknight_die;
	
	dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";

	walkmonster_start();
};

// Replaces entity with a Knight
void() ConvertToKnight =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");
	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/knight.mdl");

	setsize (self, '-16 -16 -24', '16 16 40');
	if (self.flags & FL_FLY)
		self.flags = self.flags - (self.flags & FL_FLY);
	if (self.flags & FL_SWIM)
		self.flags = self.flags - (self.flags & FL_SWIM);
	if (self.spawnflags & SPAWN_CRUCIFIED)
		self.spawnflags = self.spawnflags - (self.spawnflags & SPAWN_CRUCIFIED);
	self.health = 75;
	self.classname = "monster_knight";
	self.frame = $stand1;
	self.th_stand = knight_stand1;
	self.th_walk = knight_walk1;
	self.th_run = knight_run1;
	self.th_melee = knight_atk1;
	self.th_pain = knight_pain;
	self.th_die = knight_die;
	self.th_missile = SUB_Null;
	
	dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";

	walkmonster_start();
};

// Replaces entity with an Ogre
void() ConvertToOgre =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");

	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/ogre.mdl");

	setsize (self, VEC_HULL2_MIN, VEC_HULL2_MAX);
	if (self.flags & FL_FLY)
		self.flags = self.flags - (self.flags & FL_FLY);
	if (self.flags & FL_SWIM)
		self.flags = self.flags - (self.flags & FL_SWIM);
	if (self.spawnflags & SPAWN_CRUCIFIED)
		self.spawnflags = self.spawnflags - (self.spawnflags & SPAWN_CRUCIFIED);
	self.health = 200;
	self.classname = "monster_ogre";
	self.frame = $stand1;
	self.th_stand = ogre_stand1;
	self.th_walk = ogre_walk1;
	self.th_run = ogre_run1;
	self.th_die = ogre_die;
	self.th_melee = ogre_melee;
	self.th_missile = ogre_nail1;
	self.th_pain = ogre_pain;
	
	dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";

	walkmonster_start();
};

// Replaces entity with a Vore
void() ConvertToVore =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");
	
	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;
	
	setmodel (self, "progs/shalrath.mdl");
	setsize (self, VEC_HULL2_MIN, VEC_HULL2_MAX);
	if (self.flags & FL_FLY)
		self.flags = self.flags - (self.flags & FL_FLY);
	if (self.flags & FL_SWIM)
		self.flags = self.flags - (self.flags & FL_SWIM);
	if (self.spawnflags & SPAWN_CRUCIFIED)
		self.spawnflags = self.spawnflags - (self.spawnflags & SPAWN_CRUCIFIED);
	self.health = 400;
	self.classname = "monster_shalrath";
	self.frame = $stand1;
	self.th_stand = shal_stand;
	self.th_walk = shal_walk1;
	self.th_run = shal_run1;
	self.th_die = shalrath_die;
	self.th_pain = shalrath_pain;
	self.th_missile = shal_attack1;
	self.th_melee = shal_attack1;

	dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";

	walkmonster_start();
};

// Replaces entity with a Shambler
void() ConvertToShambler =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");

	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;
	setmodel (self, "progs/shambler.mdl");

	setsize (self, VEC_HULL2_MIN, VEC_HULL2_MAX);
	if (self.flags & FL_FLY)
		self.flags = self.flags - (self.flags & FL_FLY);
	if (self.flags & FL_SWIM)
		self.flags = self.flags - (self.flags & FL_SWIM);
	if (self.spawnflags & SPAWN_CRUCIFIED)
		self.spawnflags = self.spawnflags - (self.spawnflags & SPAWN_CRUCIFIED);
	self.health = 600;
	self.classname = "monster_shambler";
	self.frame = $stand1;
	self.th_stand = sham_stand1;
	self.th_walk = sham_walk1;
	self.th_run = sham_run1;
	self.th_die = sham_die;
	self.th_melee = sham_melee;
	self.th_missile = sham_magic1;
	self.th_pain = sham_pain;
	
	dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";

	walkmonster_start();
};

// Replaces entity with a Grunt
void() ConvertToGrunt =
{	
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");
	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/soldier.mdl");

	setsize (self, '-16 -16 -24', '16 16 40');
	if (self.flags & FL_FLY)
		self.flags = self.flags - (self.flags & FL_FLY);
	if (self.flags & FL_SWIM)
		self.flags = self.flags - (self.flags & FL_SWIM);
	if (self.spawnflags & SPAWN_CRUCIFIED)
		self.spawnflags = self.spawnflags - (self.spawnflags & SPAWN_CRUCIFIED);
	self.health = 30;
	self.classname = "monster_army";
	self.frame = $stand1;
	self.th_stand = army_stand1;
	self.th_walk = army_walk1;
	self.th_run = army_run1;
	self.th_missile = army_atk1;
	self.th_pain = army_pain;
	self.th_die = army_die;
	self.th_melee = army_atk1;

	dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";

	walkmonster_start();
};

// Replaces entity with an Spawn
void() ConvertToSpawn =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");
	
	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/tarbaby.mdl");

	setsize (self, '-16 -16 -24', '16 16 40');
	if (self.flags & FL_FLY)
		self.flags = self.flags - (self.flags & FL_FLY);
	if (self.flags & FL_SWIM)
		self.flags = self.flags - (self.flags & FL_SWIM);
	if (self.spawnflags & SPAWN_CRUCIFIED)
		self.spawnflags = self.spawnflags - (self.spawnflags & SPAWN_CRUCIFIED);
	self.health = 80;
	self.classname = "monster_tarbaby";
	self.frame = $stand1;
	self.th_stand = tbaby_stand1;
	self.th_walk = tbaby_walk1;
	self.th_run = tbaby_run1;
	self.th_missile = tbaby_jump1;
	self.th_melee = tbaby_jump1;
	self.th_die = tbaby_die1;
	self.th_pain = SUB_Null;
	
	dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";

	walkmonster_start();
};

// Replaces entity with a Scrag
void() ConvertToScrag =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");

	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/wizard.mdl");

	setsize (self, '-16 -16 -24', '16 16 40');
	if (!(self.flags & FL_FLY))
		self.flags = self.flags | FL_FLY;
	if (self.flags & FL_SWIM)
		self.flags = self.flags - (self.flags & FL_SWIM);
	if (self.spawnflags & SPAWN_CRUCIFIED)
		self.spawnflags = self.spawnflags - (self.spawnflags & SPAWN_CRUCIFIED);
	self.health = 80;
	self.classname = "monster_wizard";
	self.frame = $stand1;
	self.th_stand = wiz_stand1;
	self.th_walk = wiz_walk1;
	self.th_run = wiz_run1;
	self.th_missile = Wiz_Missile;
	self.th_pain = Wiz_Pain;
	self.th_die = wiz_die;
	self.th_melee = Wiz_Missile;
		
	dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";

	flymonster_start ();
};

// Replaces entity with a (non-crucified) Zombie
void() ConvertToZombie =
{
	if (deathmatch)
	{
		remove(self);
		return;
	}
	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");

	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;

	setmodel (self, "progs/zombie.mdl");

	setsize (self, '-16 -16 -24', '16 16 40');    
	if (self.flags & FL_FLY)
		self.flags = self.flags - (self.flags & FL_FLY);
	if (self.flags & FL_SWIM)
		self.flags = self.flags - (self.flags & FL_SWIM);
	self.health = 60;
	self.classname = "monster_zombie";
	self.frame = $stand1;
	self.th_stand = zombie_stand1;
	self.th_walk = zombie_walk1;
	self.th_run = zombie_run1;
	self.th_pain = zombie_pain;
	self.th_die = zombie_die;
	self.th_missile = zombie_missile;
	self.th_melee = zombie_missile;

    dprint(self.classname);
	dprint("\n");
	self.ApConverted = "1";

	walkmonster_start();
};

// END MONSTERS

// START PICKUPS

// Converts entity to a health pack
// "type" indicates whether it's a 15 pack, 25 pack or 100 pack
void() ConvertToHealth =
{	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");

	self.touch = health_touch;
	self.classname = "item_health";
	if (self.QualityType == 1)
	{
        setmodel(self, "maps/b_bh10.bsp");
		self.noise = "items/r_item1.wav";
		self.healamount = 15;
		self.healtype = 0;
	}
	else if (self.QualityType == 2)
	{		
		setmodel(self, "maps/b_bh25.bsp");
		self.noise = "items/health1.wav";
		self.healamount = 25;
		self.healtype = 1;
	}
	setsize (self, '0 0 0', '32 32 56');
	dprint(self.classname);
	dprint(" (");
	dprint(ftos(self.healamount));
	dprint(")");
	dprint("\n");
	self.ApConverted = "1";
	StartItem ();
};

// END PICKUPS

// START AMMO

// Converts entity into a box of shells
// "type" contains whether it's a small box (20) or a big box (40)
void() ConvertToShells =
{	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");

	self.touch = ammo_touch;
	self.classname = "item_shells";
	if (self.QualityType == 1)
	{
		setmodel (self, "maps/b_shell0.bsp");
		self.aflag = 20;
	}
	else if (self.QualityType == 2)
	{
		setmodel (self, "maps/b_shell1.bsp");
		self.aflag = 40;
	}
	self.weapon = 1;
	self.netname = "shells";
	self.skin = 0;
	setsize (self, '0 0 0', '32 32 56');
	dprint(self.classname);
	dprint(" (");
	dprint(ftos(self.aflag));
	dprint(")");
	dprint("\n");
	self.ApConverted = "1";
	StartItem ();
};

// Converts entity into a box of nails
// "type" contains whether it's a small box (25) or a big box (50)
void() ConvertToNails =
{	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");

	self.touch = ammo_touch;
	self.classname = "item_spikes";
	if (self.QualityType == 1)
	{
		setmodel (self, "maps/b_nail0.bsp");
		self.aflag = 25;
	}
	else if (self.QualityType == 2)
	{
		setmodel (self, "maps/b_nail1.bsp");
		self.aflag = 50;
	}
	self.weapon = 2;
	self.netname = "nails";
	self.skin = 0;
	setsize (self, '0 0 0', '32 32 56');
	dprint(self.classname);
	dprint(" (");
	dprint(ftos(self.aflag));
	dprint(")");
	dprint("\n");
	self.ApConverted = "1";
	StartItem ();
};

// Converts entity into a box of rockets
// "type" contains whether it's a small box (5) or a big box (10)
void() ConvertToRockets =
{	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");

	self.touch = ammo_touch;
	self.classname = "item_rockets";
	if (self.QualityType == 1)
	{
		setmodel (self, "maps/b_rock0.bsp");
		self.aflag = 5;
	}
	else if (self.QualityType == 2)
	{
		setmodel (self, "maps/b_rock1.bsp");
		self.aflag = 10;
	}
	self.weapon = 3;
	self.netname = "rockets";
	self.skin = 0;
	setsize (self, '0 0 0', '32 32 56');
	dprint(self.classname);
	dprint(" (");
	dprint(ftos(self.aflag));
	dprint(")");
	dprint("\n");
	self.ApConverted = "1";
	StartItem ();
};

// Converts entity into a box of cells
// "type" contains whether it's a small box (6) or a big box (12)
void() ConvertToCells =
{	
	dprint("ApConverted ");
	dprint(self.classname);
	dprint(" to ");

	self.touch = ammo_touch;
	self.classname = "item_cells";
	if (self.QualityType == 1)
	{
		setmodel (self, "maps/b_batt0.bsp");
		self.aflag = 6;
	}
	else if (self.QualityType == 2)
	{
		setmodel (self, "maps/b_batt1.bsp");
		self.aflag = 12;
	}
	self.weapon = 4;
	self.netname = "cells";
	self.skin = 0;
	setsize (self, '0 0 0', '32 32 56');
	dprint(self.classname);
	dprint(" (");
	dprint(ftos(self.aflag));
	dprint(")");
	dprint("\n");
	self.ApConverted = "1";
	StartItem ();
};

// END AMMO

