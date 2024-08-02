entity hub_tele;

void() DisableHubTele;

void() DoHubTele {
	DisableHubTele();
	EndLevel(other);
}

void() ActivateHubTele {
	self.touch = DoHubTele;
	self.effects = self.effects | EF_BRIGHTFIELD | EF_DIMLIGHT;
	self.nextthink = time + 99999999;
}

void() DisableHubTele {
	hub_tele.effects = 0;
	hub_tele.touch = SUB_Null;
	hub_tele.nextthink = time + 10;
	hub_tele.think = ActivateHubTele;
}

void(entity startpos) spawn_hub_tele {
	precache_model ("progs/s_light.spr");

	hub_tele = spawn();
	setorigin (hub_tele, startpos.origin);
	setmodel ( hub_tele, "progs/s_light.spr" );
	hub_tele.movetype = MOVETYPE_NONE;
	hub_tele.solid = SOLID_TRIGGER;
	DisableHubTele ();
	setsize (hub_tele, '-16 -16 -24', '16 16 24');
}
