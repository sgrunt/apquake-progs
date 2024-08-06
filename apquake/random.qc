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
			items_to_randomize[i].think = ConvertToCells;
		} else {
			items_to_randomize[i].think = ConvertToRockets;
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
