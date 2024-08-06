void() RandomizeItems {
	local float i;
	local float j;
	local float total_high_quality;
	i = 0;
	while (i < item_count) {
		if (items_to_randomize[i].QualityType == 2) {
			total_high_quality = total_high_quality + 1;
		}
		i = i + 1;
	}
	i = 0;
	while (i < item_count) {
		// these numbers are based on episode 1-4 + end totals
		j = rand() * 1698;
		if (j < 789) {
			items_to_randomize[i].think = ConvertToHealth;
		} else if (j < 1131) {
			items_to_randomize[i].think = ConvertToNails;
		} else if (j < 1415) {
			items_to_randomize[i].think = ConvertToShells;
		} else if (j < 1590) {
			items_to_randomize[i].think = ConvertToRockets;
		} else {
			items_to_randomize[i].think = ConvertToCells;
		}
		j = rand() * item_count;
		if (j <= total_high_quality) {
			items_to_randomize[i].QualityType = 2;
		} else {
			items_to_randomize[i].QualityType = 1;
		}
		i = i + 1;
	}
}

void() RandomizeMonsters {
	local float i;
	local float j;
	local float small_cutoff;
	local float med_cutoff;
	i = 0;
	while (i < monster_count) {
		if (monsters_to_randomize[i].QualityType == 0) {
			small_cutoff = small_cutoff + 1;
			med_cutoff = med_cutoff + 1;
		}
		if (monsters_to_randomize[i].QualityType == 1) {
			med_cutoff = med_cutoff + 1;
		}
		i = i + 1;
	}
	i = 0;
	while (i < monster_count) {
		// these numbers are based on episode 1-4 + end totals
		j = rand() * total_monsters;
		if (j < small_cutoff) {
			j = rand() * 877;
			if (j < 30) {
				monsters_to_randomize[i].think = ConvertToDog;
			} else if (j < 155) {
				monsters_to_randomize[i].think = ConvertToKnight;
			} else if (j < 289) {
				monsters_to_randomize[i].think = ConvertToGrunt;
			} else if (j < 359) {
				monsters_to_randomize[i].think = ConvertToEnforcer;
			} else if (j < 548) {
				monsters_to_randomize[i].think = ConvertToScrag;
			} else {
				monsters_to_randomize[i].think = ConvertToZombie;
			}
		} else if (j < med_cutoff) {
			j = rand() * 850;
			if (j < 214) {
				monsters_to_randomize[i].think = ConvertToFiend;
			} else if (j < 390) {
				monsters_to_randomize[i].think = ConvertToDeathKnight;
			} else if (j < 717) {
				monsters_to_randomize[i].think = ConvertToOgre;
			} else {
				monsters_to_randomize[i].think = ConvertToSpawn;
			}
		} else {
			j = rand() * 111;
			if (j < 60) {
				monsters_to_randomize[i].think = ConvertToShambler;
			} else {
				monsters_to_randomize[i].think = ConvertToVore;
			}
		}
		monsters_to_randomize[i].Unstuckable = 1;
		i = i + 1;
	}
}

void() RandomizeMonstersChaotic {
	local float i;
	local float j;
	i = 0;
	while (i < monster_count) {
		// these numbers are based on episode 1-4 + end totals
		j = rand() * 1838;
		if (j < 30) {
			monsters_to_randomize[i].think = ConvertToDog;
		} else if (j < 155) {
			monsters_to_randomize[i].think = ConvertToKnight;
		} else if (j < 289) {
			monsters_to_randomize[i].think = ConvertToGrunt;
		} else if (j < 618) {
			monsters_to_randomize[i].think = ConvertToZombie;
		} else if (j < 794) {
			monsters_to_randomize[i].think = ConvertToDeathKnight;
		} else if (j < 864) {
			monsters_to_randomize[i].think = ConvertToEnforcer;
		} else if (j < 1229) {
			monsters_to_randomize[i].think = ConvertToOgre;
		} else if (j < 1418) {
			monsters_to_randomize[i].think = ConvertToScrag;
		} else if (j < 1513) {
			monsters_to_randomize[i].think = ConvertToSpawn;
		} else if (j < 1727) {
			monsters_to_randomize[i].think = ConvertToFiend;
		} else if (j < 1787) {
			monsters_to_randomize[i].think = ConvertToShambler;
		} else {
			monsters_to_randomize[i].think = ConvertToVore;
		}
		monsters_to_randomize[i].Unstuckable = 1;
		i = i + 1;
	}
}
