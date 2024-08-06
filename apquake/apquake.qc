void() ConvertItem;

void() precache_apworld = {
    precache_model ("progs/apitem.mdl");
    precache_sound ("items/itembk2.wav");

	precache_model ("progs/demon.mdl");
	precache_model ("progs/h_demon.mdl");
	precache_sound ("demon/ddeath.wav");
	precache_sound ("demon/dhit2.wav");
	precache_sound ("demon/djump.wav");
	precache_sound ("demon/dpain1.wav");
	precache_sound ("demon/idle1.wav");
	precache_sound ("demon/sight2.wav");
	precache_model ("progs/h_dog.mdl");
	precache_model ("progs/dog.mdl");
	precache_sound ("dog/dattack1.wav");
	precache_sound ("dog/ddeath.wav");
	precache_sound ("dog/dpain1.wav");
	precache_sound ("dog/dsight.wav");
	precache_sound ("dog/idle.wav");    
	precache_model2 ("progs/enforcer.mdl");
	precache_model2 ("progs/h_mega.mdl");
	precache_model2 ("progs/laser.mdl");
	precache_sound2 ("enforcer/death1.wav");
	precache_sound2 ("enforcer/enfire.wav");
	precache_sound2 ("enforcer/enfstop.wav");
	precache_sound2 ("enforcer/idle1.wav");
	precache_sound2 ("enforcer/pain1.wav");
	precache_sound2 ("enforcer/pain2.wav");
	precache_sound2 ("enforcer/sight1.wav");
	precache_sound2 ("enforcer/sight2.wav");
	precache_sound2 ("enforcer/sight3.wav");
	precache_sound2 ("enforcer/sight4.wav");
	precache_model2 ("progs/fish.mdl");
	precache_sound2 ("fish/death.wav");
	precache_sound2 ("fish/bite.wav");
	precache_sound2 ("fish/idle.wav");
	precache_model2 ("progs/hknight.mdl");
	precache_model2 ("progs/k_spike.mdl");
	precache_model2 ("progs/h_hellkn.mdl");
	precache_sound2 ("hknight/attack1.wav");
	precache_sound2 ("hknight/death1.wav");
	precache_sound2 ("hknight/pain1.wav");
	precache_sound2 ("hknight/sight1.wav");
	precache_sound ("hknight/hit.wav"); // used by C code, so don't sound2
	precache_sound2 ("hknight/slash1.wav");
	precache_sound2 ("hknight/idle.wav");
	precache_sound2 ("hknight/grunt.wav");
	precache_sound ("knight/sword1.wav");
	precache_sound ("knight/sword2.wav");
	precache_model ("progs/knight.mdl");
	precache_model ("progs/h_knight.mdl");
	precache_sound ("knight/kdeath.wav");
	precache_sound ("knight/khurt.wav");
	precache_sound ("knight/ksight.wav");
	precache_sound ("knight/sword1.wav");
	precache_sound ("knight/sword2.wav");
	precache_sound ("knight/idle.wav");
	precache_model ("progs/ogre.mdl");
	precache_model ("progs/h_ogre.mdl");
	precache_model ("progs/grenade.mdl");
	precache_sound ("ogre/ogdrag.wav");
	precache_sound ("ogre/ogdth.wav");
	precache_sound ("ogre/ogidle.wav");
	precache_sound ("ogre/ogidle2.wav");
	precache_sound ("ogre/ogpain1.wav");
	precache_sound ("ogre/ogsawatk.wav");
	precache_sound ("ogre/ogwake.wav");
	precache_model2 ("progs/shalrath.mdl");
	precache_model2 ("progs/h_shal.mdl");
	precache_model2 ("progs/v_spike.mdl");
	precache_sound2 ("shalrath/attack.wav");
	precache_sound2 ("shalrath/attack2.wav");
	precache_sound2 ("shalrath/death.wav");
	precache_sound2 ("shalrath/idle.wav");
	precache_sound2 ("shalrath/pain.wav");
	precache_sound2 ("shalrath/sight.wav");
	precache_model ("progs/shambler.mdl");
	precache_model ("progs/s_light.mdl");
	precache_model ("progs/h_shams.mdl");
	precache_model ("progs/bolt.mdl");
	precache_sound ("shambler/sattck1.wav");
	precache_sound ("shambler/sboom.wav");
	precache_sound ("shambler/sdeath.wav");
	precache_sound ("shambler/shurt2.wav");
	precache_sound ("shambler/sidle.wav");
	precache_sound ("shambler/ssight.wav");
	precache_sound ("shambler/melee1.wav");
	precache_sound ("shambler/melee2.wav");
	precache_sound ("shambler/smack.wav");
	precache_model ("progs/soldier.mdl");
	precache_model ("progs/h_guard.mdl");
	precache_model ("progs/gib1.mdl");
	precache_model ("progs/gib2.mdl");
	precache_model ("progs/gib3.mdl");
	precache_sound ("soldier/death1.wav");
	precache_sound ("soldier/idle.wav");
	precache_sound ("soldier/pain1.wav");
	precache_sound ("soldier/pain2.wav");
	precache_sound ("soldier/sattck1.wav");
	precache_sound ("soldier/sight1.wav");
	precache_sound ("player/udeath.wav"); // gib death    
	precache_model2 ("progs/tarbaby.mdl");
	precache_sound2 ("blob/death1.wav");
	precache_sound2 ("blob/hit1.wav");
	precache_sound2 ("blob/land1.wav");
	precache_sound2 ("blob/sight1.wav");
	precache_model ("progs/wizard.mdl");
	precache_model ("progs/h_wizard.mdl");
	precache_model ("progs/w_spike.mdl");
	precache_sound ("wizard/hit.wav"); // used by c code
	precache_sound ("wizard/wattack.wav");
	precache_sound ("wizard/wdeath.wav");
	precache_sound ("wizard/widle1.wav");
	precache_sound ("wizard/widle2.wav");
	precache_sound ("wizard/wpain.wav");
	precache_sound ("wizard/wsight.wav");
	precache_model ("progs/zombie.mdl");
	precache_model ("progs/h_zombie.mdl");
	precache_model ("progs/zom_gib.mdl");
	precache_sound ("zombie/z_idle.wav");
	precache_sound ("zombie/z_idle1.wav");
	precache_sound ("zombie/z_shot1.wav");
	precache_sound ("zombie/z_gib.wav");
	precache_sound ("zombie/z_pain.wav");
	precache_sound ("zombie/z_pain1.wav");
	precache_sound ("zombie/z_fall.wav");
	precache_sound ("zombie/z_miss.wav");
	precache_sound ("zombie/z_hit.wav");
	precache_sound ("zombie/idle_w2.wav");
    precache_model("maps/b_bh10.bsp");
    precache_sound("items/r_item1.wav");
    precache_model("maps/b_bh100.bsp");
    precache_sound("items/r_item2.wav");
    precache_model("maps/b_bh25.bsp");
	precache_sound("items/health1.wav");
    precache_model ("progs/armor.mdl");
    precache_model ("maps/b_shell1.bsp");
    precache_model ("maps/b_shell0.bsp");
    precache_model ("maps/b_nail1.bsp");
    precache_model ("maps/b_nail0.bsp");
    precache_model ("maps/b_rock1.bsp");
    precache_model ("maps/b_rock0.bsp");
    precache_model ("maps/b_batt1.bsp");
    precache_model ("maps/b_batt0.bsp");
	precache_model ("progs/invulner.mdl");
	precache_sound ("items/protect.wav");
	precache_sound ("items/protect2.wav");
	precache_sound ("items/protect3.wav");
	precache_model ("progs/suit.mdl");
	precache_sound ("items/suit.wav");
	precache_sound ("items/suit2.wav");
	precache_model ("progs/invisibl.mdl");
	precache_sound ("items/inv1.wav");
	precache_sound ("items/inv2.wav");
	precache_sound ("items/inv3.wav");
	precache_model ("progs/quaddama.mdl");
	precache_sound ("items/damage.wav");
	precache_sound ("items/damage2.wav");
	precache_sound ("items/damage3.wav");
	precache_model ("progs/g_shot.mdl");
	precache_model ("progs/g_nail.mdl");
	precache_model ("progs/g_nail2.mdl");
	precache_model ("progs/g_rock.mdl");
	precache_model ("progs/g_rock2.mdl");
	precache_model ("progs/g_light.mdl");
}

void() SetApItems = {
    local entity temp;
    local float i;

    item_count = 0;

    seed = mod(cvar("ap_rand_seed"), 40000000);

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
		|| temp.classname == "item_armorInv" || (temp.classname == "item_health" && (temp.spawnflags & H_MEGA))
                || temp.classname == "item_artifact_invulnerability"
                || temp.classname == "item_artifact_invisibility" || temp.classname == "item_artifact_super_damage"
		|| temp.classname == "weapon_supershotgun" || temp.classname == "weapon_nailgun"
                || temp.classname == "weapon_supernailgun" || temp.classname == "weapon_grenadelauncher"
                || temp.classname == "weapon_rocketlauncher" || temp.classname == "weapon_lightning") {
			if (!temp.target && !temp.killtarget && !temp.delay && is_ap_location_checked(temp.ApIndex)) {
				remove(temp);
			} else {
			        dprint(world.model);
				dprint(": Replacing index ");
				dprint(ftos(temp.ApIndex));
				dprint(" of type ");
				dprint(temp.netname);
				dprint("\n");
				temp.Unstuckable = 1;
				temp.nextthink = time;
				temp.think = ConvertItem;
			}
		} else if (temp.classname == "item_health") {
			temp.nextthink = time;
			temp.think = ConvertToHealth;
			if (temp.spawnflags & H_ROTTEN) {
				temp.QualityType = 1;
			} else {
				temp.QualityType = 2;
			}
			items_to_randomize[item_count] = temp;
			item_count = item_count + 1;
		} else if (temp.classname == "item_shells") {
			temp.nextthink = time;
			temp.think = ConvertToShells;
			if (temp.spawnflags & WEAPON_BIG2) {
				temp.QualityType = 2;
			} else {
				temp.QualityType = 1;
			}
			items_to_randomize[item_count] = temp;
			item_count = item_count + 1;
		} else if (temp.classname == "item_spikes") {
			temp.nextthink = time;
			temp.think = ConvertToNails;
			if (temp.spawnflags & WEAPON_BIG2) {
				temp.QualityType = 2;
			} else {
				temp.QualityType = 1;
			}
			items_to_randomize[item_count] = temp;
			item_count = item_count + 1;
		} else if (temp.classname == "item_rockets") {
			temp.nextthink = time;
			temp.think = ConvertToRockets;
			if (temp.spawnflags & WEAPON_BIG2) {
				temp.QualityType = 2;
			} else {
				temp.QualityType = 1;
			}
			items_to_randomize[item_count] = temp;
			item_count = item_count + 1;
		} else if (temp.classname == "item_cells") {
			temp.nextthink = time;
			temp.think = ConvertToCells;
			if (temp.spawnflags & WEAPON_BIG2) {
				temp.QualityType = 2;
			} else {
				temp.QualityType = 1;
			}
			items_to_randomize[item_count] = temp;
			item_count = item_count + 1;
		}
	    }
	}
    	temp = find(world, ApConverted, "");
    }

    i = cvar("ap_random_items");
    if (i == 1) {
	ShuffleItems();
    } else if (i == 2) {
    	RandomizeItems();
    }
}

void() ConvertItem {
	if (world.model == "maps/e1m8.bsp" && self.ApIndex == 468) {
		// unreachable
		remove(self);
		return;
	}
	if (self.classname == "item_health") {
		self.origin_x = self.origin_x + 16;
		self.origin_y = self.origin_y + 16;
		self.origin_z = self.origin_z + 24;
	}
	self.oldmins = self.mins;
	self.touch = powerup_touch;
	self.classname = "item_archipelago";
	self.noise = "items/itembk2.wav";
	setmodel ( self, "progs/apitem.mdl" );
	self.netname = "Archipelago Item";
	self.items = 0;
	self.skin = 0;
	if (is_major_ap_item(self.ApIndex) > 0) {
		self.effects = self.effects | EF_BRIGHTFIELD | EF_DIMLIGHT;
	}
	setsize ( self, '-16 -16 -24', '16 16 32' );
	StartItem();
}

void() ApItemThink {
	if (self.target || self.killtarget || self.delay) {
		return;
	}

	if (is_ap_location_checked(self.ApIndex)) {
		remove(self);
		return;
	}

	self.nextthink = time + 0.1;
}
