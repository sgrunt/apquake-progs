void() ConvertItem;

void() precache_apworld = {
    precache_model ("progs/quaddama.mdl");
    precache_sound ("items/damage.wav");
    precache_sound ("items/damage2.wav");
    precache_sound ("items/damage3.wav");
}

void() SetApItems = {
    local entity temp;
    local float i;

    seed = 12345678;

    temp = find(world, ApConverted, "");
    while(temp != world) {
        temp.ApConverted = "-1";
	temp.Unstuckable = 0;
	if(temp.classname != "worldspawn")
	{
	    if(temp.flags & FL_ITEM)
	    {
	        if(temp.classname == "item_key1" || temp.classname == "item_key2" || temp.classname == "item_sigil"
		|| temp.classname == "item_armor1" || temp.classname == "item_armor2"
                || (temp.classname == "item_health" && (temp.spawnflags & H_MEGA))
		|| temp.classname == "item_weapon"
		|| temp.classname == "item_armorInv" || (temp.classname == "item_health" && (temp.spawnflags & H_MEGA))
                || temp.classname == "item_artifact_invulnerability" || temp.classname == "item_artifact_envirosuit"
                || temp.classname == "item_artifact_invisibility" || temp.classname == "item_artifact_super_damage"
		|| temp.classname == "weapon_supershotgun" || temp.classname == "weapon_nailgun"
                || temp.classname == "weapon_supernailgun" || temp.classname == "weapon_grenadelauncher"
                || temp.classname == "weapon_rocketlauncher" || temp.classname == "weapon_lightning") {
			dprint("Replacing index ");
			dprint(ftos(temp.ApIndex));
			dprint(" of type ");
			dprint(temp.classname);
			dprint("\n");
			temp.Unstuckable = 1;
			temp.nextthink = time;
			temp.think = ConvertItem;
		}
	    }
	}
    	temp = find(world, ApConverted, "");
    }
}

void() ConvertItem {
	self.oldmins = self.mins;
	self.touch = powerup_touch;
	self.classname = "item_artifact_super_damage";
	self.noise = "items/damage.wav";
	setmodel ( self, "progs/quaddama.mdl" );
	self.netname = "Quad Damage";
	self.items = IT_QUAD;
	self.skin = 0;
	setsize ( self, '-16 -16 -24', '16 16 32' );
	StartItem();
}
