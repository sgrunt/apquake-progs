float item_count;
entity items_to_randomize[512];

void() ShuffleItems {
	local float i;
	local float j;
	local float temp_quality;
	local void() temp_func;
	i = 1;
	j = 0;
	while (i < item_count) {
		j = floor(rand() * (i + 1));
		if (j != i) {
			temp_func = items_to_randomize[i].think;
			temp_quality = items_to_randomize[i].QualityType;
			items_to_randomize[i].think = items_to_randomize[j].think;
			items_to_randomize[i].QualityType = items_to_randomize[j].QualityType;
			items_to_randomize[j].think = temp_func;
			items_to_randomize[j].QualityType = temp_quality;
		}
		i = i + 1;
	}
}

float monster_count;
entity monsters_to_randomize[512];

void() ShuffleMonsters {
	local float i;
	local float j;
	local void() temp_func;
	i = 1;
	j = 0;
	while (i < monster_count) {
		j = floor(rand() * (i + 1));
		if (j != i) {
			temp_func = monsters_to_randomize[i].think;
			monsters_to_randomize[i].think = monsters_to_randomize[j].think;
			monsters_to_randomize[j].think = temp_func;
		}
		i = i + 1;
	}
}
