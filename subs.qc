.float ApIndex;
float(float playAlertSound) FindTarget;
.string ApConverted;
.vector oldmins;

void() SUB_Null = {};

void() SUB_Remove = {remove(self);};


/*
QuakeEd only writes a single float for angles (bad idea), so up and down are
just constant angles.
*/
vector() SetMovedir =
{
	if (self.angles == '0 -1 0')
		self.movedir = '0 0 1';
	else if (self.angles == '0 -2 0')
		self.movedir = '0 0 -1';
	else
	{
		makevectors (self.angles);
		self.movedir = v_forward;
	}
	
	self.angles = '0 0 0';
};

/*
================
InitTrigger
================
*/
void() InitTrigger =
{
// trigger angles are used for one-way touches.  An angle of 0 is assumed
// to mean no restrictions, so use a yaw of 360 instead.
	if (self.angles != '0 0 0')
		SetMovedir ();
	self.solid = SOLID_TRIGGER;
	setmodel (self, self.model);	// set size and link into world
	self.movetype = MOVETYPE_NONE;
	self.modelindex = 0;
	self.model = "";
};

/*
=============
SUB_CalcMove

calculate self.velocity and self.nextthink to reach dest from
self.origin traveling at speed
===============
*/
void(entity ent, vector tdest, float tspeed, void() func) SUB_CalcMoveEnt =
{
local entity	stemp;
	stemp = self;
	self = ent;

	SUB_CalcMove (tdest, tspeed, func);
	self = stemp;
};

void(vector tdest, float tspeed, void() func) SUB_CalcMove =
{
local vector	vdestdelta;
local float		len, traveltime;

	if (!tspeed)
		objerror("No speed is defined!");

	self.think1 = func;
	self.finaldest = tdest;
	self.think = SUB_CalcMoveDone;

	if (tdest == self.origin)
	{
		self.velocity = '0 0 0';
		self.nextthink = self.ltime + 0.1;
		return;
	}
		
// set destdelta to the vector needed to move
	vdestdelta = tdest - self.origin;
	
// calculate length of vector
	len = vlen (vdestdelta);
	
// divide by speed to get time to reach dest
	traveltime = len / tspeed;

	if (traveltime < 0.1)
	{
		self.velocity = '0 0 0';
		self.nextthink = self.ltime + 0.1;
		return;
	}
	
// set nextthink to trigger a think when dest is reached
	self.nextthink = self.ltime + traveltime;

// scale the destdelta vector by the time spent traveling to get velocity
	self.velocity = vdestdelta * (1/traveltime);	// qcc won't take vec/float	
};

/*
============
After moving, set origin to exact final destination
============
*/
void()  SUB_CalcMoveDone =
{
	setorigin(self, self.finaldest);
	self.velocity = '0 0 0';
	self.nextthink = -1;
	if (self.think1)
		self.think1();
};


/*
=============
SUB_CalcAngleMove

calculate self.avelocity and self.nextthink to reach destangle from
self.angles rotating 

The calling function should make sure self.think is valid
===============
*/
void(entity ent, vector destangle, float tspeed, void() func) SUB_CalcAngleMoveEnt =
{
local entity		stemp;
	stemp = self;
	self = ent;
	SUB_CalcAngleMove (destangle, tspeed, func);
	self = stemp;
};

void(vector destangle, float tspeed, void() func) SUB_CalcAngleMove =
{
local vector	destdelta;
local float		len, traveltime;

	if (!tspeed)
		objerror("No speed is defined!");
		
// set destdelta to the vector needed to move
	destdelta = destangle - self.angles;
	
// calculate length of vector
	len = vlen (destdelta);
	
// divide by speed to get time to reach dest
	traveltime = len / tspeed;

// set nextthink to trigger a think when dest is reached
	self.nextthink = self.ltime + traveltime;

// scale the destdelta vector by the time spent traveling to get velocity
	self.avelocity = destdelta * (1 / traveltime);
	
	self.think1 = func;
	self.finalangle = destangle;
	self.think = SUB_CalcAngleMoveDone;
};

/*
============
After rotating, set angle to exact final angle
============
*/
void() SUB_CalcAngleMoveDone =
{
	self.angles = self.finalangle;
	self.avelocity = '0 0 0';
	self.nextthink = -1;
	if (self.think1)
		self.think1();
};


//=============================================================================

void() DelayThink =
{
	activator = self.enemy;
	SUB_UseTargets ();
	remove(self);
};

/*
==============================
SUB_UseTargets

the global "activator" should be set to the entity that initiated the firing.

If self.delay is set, a DelayedUse entity will be created that will actually
do the SUB_UseTargets after that many seconds have passed.

Centerprints any self.message to the activator.

Removes all entities with a targetname that match self.killtarget,
and removes them, so some events can remove other triggers.

Search for (string)targetname in all entities that
match (string)self.target and call their .use function

==============================
*/
void() SUB_UseTargets =
{
	local entity t, stemp, otemp, act;

//
// check for a delay
//
	if (self.delay)
	{
	// create a temp object to fire at a later time
		t = spawn();
		t.classname = "DelayedUse";
		t.nextthink = time + self.delay;
		t.think = DelayThink;
		t.enemy = activator;
		t.message = self.message;
		t.killtarget = self.killtarget;
		t.target = self.target;
		return;
	}
	
	
//
// print the message
//
	if (activator.classname == "player" && self.message != "")
	{
		centerprint (activator, self.message);
		if (!self.noise)
			sound (activator, CHAN_VOICE, "misc/talk.wav", 1, ATTN_NORM);
	}

//
// kill the killtagets
//
	if (self.killtarget)
	{
		t = world;
		do
		{
			t = find (t, targetname, self.killtarget);
			if (!t)
				return;
			remove (t);
		} while ( 1 );
	}
	
//
// fire targets
//
	if (self.target)
	{
		act = activator;
		t = world;
		do
		{
			t = find (t, targetname, self.target);
			if (!t)
			{
				return;
			}
			stemp = self;
			otemp = other;
			self = t;
			other = stemp;
			if (self.use != SUB_Null)
			{
				if (self.use)
					self.use ();
			}
			self = stemp;
			other = otemp;
			activator = act;
		} while ( 1 );
	}
	

};


/*

in nightmare mode, all attack_finished times become 0
some monsters refire twice automatically

*/

void(float normal) SUB_AttackFinished =
{
	self.cnt = 0;		// refire count for nightmare
	if (skill != 3)
		self.attack_finished = time + normal;
};

float (entity targ) visible;

void (void() thinkst) SUB_CheckRefire =
{
	if (skill != 3)
		return;
	if (self.cnt == 1)
		return;
	if (!visible (self.enemy))
		return;
	self.cnt = 1;
	self.think = thinkst;
};

float mod(float a, float b) = {
    return a - (floor(a/b) * b);
};

float seed, next;

float rand() = {
    float a = 11;
    float c = 10653;
    float m = 1000000;
    if(next == 0) next = seed;
    next = floor(mod((next * a + c), m));
    return (next / m);
};

float fmin(float a, float b) = {
    if(a <= b)
        return a;
    return b;
};

float(float lower, float upper) Random =
{
        return floor((rand() * (upper - lower + 1)) + lower);
};

void(entity e, float flying) UnstuckMonster = 
{
	local entity oldself;
	local float CURRENT_TRY;
	local float MAX_TRIES;
	local vector fixvector;
	local vector old;
	local vector min;
	local vector max;
	local vector diff;
	local float canMove, seesTarget, alreadySeesTarget;

	oldself = self;
	self = e;

	MAX_TRIES = 1500;
	CURRENT_TRY = 0;
	diff_x = self.size_x;
	diff_y = self.size_y;
	diff_z = self.size_z;
	old_x = self.origin_x;
	old_y = self.origin_y;
	old_z = self.origin_z;
	dprint("Attempting to unstuck ");
	dprint(self.classname);
	dprint(" (");
	dprint(vtos(self.origin));
	dprint(").");
	alreadySeesTarget = FindTarget(FALSE);
	do
	{
		fixvector_x = old_x;
		fixvector_y = old_y;
		fixvector_z = old_z;
		// Give six tries with a single coordinate change in case it works
		diff_x = fmin(diff_x + 3, 1200);
		diff_y = fmin(diff_y + 3, 1200);
		diff_z = fmin(diff_z + 3, 1200);
		min_x = old_x - diff_x;
		min_y = old_y - diff_y;
		min_z = old_z - diff_z;
		max_x = old_x + diff_x;
		max_y = old_y + diff_y;
		max_z = old_z + diff_z;
		fixvector_x = Random(min_x, max_x);
		fixvector_y = Random(min_y, max_y);
		fixvector_z = Random(min_z, max_z);
		setorigin(self, fixvector);
		if(!flying)
			droptofloor();
		CURRENT_TRY = CURRENT_TRY + 1;
		canMove = walkmove(0,0);
		if(canMove && !alreadySeesTarget)
			seesTarget = !FindTarget(FALSE);							// Don't move the monster to where they can already see the player (unless they already could do so)
		if(canMove && (alreadySeesTarget || !seesTarget))
		{
			dprint(" Worked after ");
			dprint(ftos(CURRENT_TRY));
			dprint(" attempt(s) and relocated to (");
			dprint(vtos(self.origin));
			dprint(").\n");
		}
	}
	while(!canMove && CURRENT_TRY < MAX_TRIES);
	self.velocity_z = -500;
	self = oldself;
};

void(entity e) UnstuckObject =
{
        local entity oldself;
        local float CURRENT_TRY;
        local float MAX_TRIES;
        local vector fixvector;
        local vector old;
        local vector min;
        local vector max;
        local vector diff;
        local float dropped;

        oldself = self;
        self = e;

        MAX_TRIES = 1500;
        CURRENT_TRY = 0;
        diff_x = self.size_x;
        diff_y = self.size_y;
        diff_z = self.size_z;
        old_x = self.origin_x;
        old_y = self.origin_y;
        old_z = self.origin_z;
        dprint("Attempting to unstuck ");
        dprint(self.classname);
        dprint(" (");
        dprint(vtos(self.origin));
        dprint(").");
        do
        {
                fixvector_x = old_x;
                fixvector_y = old_y;
                fixvector_z = old_z;
                // Give six tries with a single coordinate change in case it works
                diff_x = fmin(diff_x + 3, 1200);
                diff_y = fmin(diff_y + 3, 1200);
                diff_z = fmin(diff_z + 3, 1200);
                min_x = old_x - diff_x;
                min_y = old_y - diff_y;
                min_z = old_z - diff_z;
                max_x = old_x + diff_x;
                max_y = old_y + diff_y;
                max_z = old_z + diff_z;
                fixvector_x = Random(min_x, max_x);
                fixvector_y = Random(min_y, max_y);
                fixvector_z = Random(min_z, max_z);
                setorigin(self, fixvector);
                CURRENT_TRY = CURRENT_TRY + 1;
                dropped = droptofloor();
                if(dropped)
                {
                        dprint(" Worked after ");
                        dprint(ftos(CURRENT_TRY));
                        dprint(" attempt(s) and relocated to (");
                        dprint(vtos(self.origin));
                        dprint(").\n");
                }
        }
        while(!dropped && CURRENT_TRY < MAX_TRIES);
        self.velocity_z = -500;
        self = oldself;
};

float sqrt(float x) =
{
    float rt = 1, ort = 0;
    while(ort!=rt)
    {
        ort = rt;
        rt = ((x/rt) + rt) / 2;
    }
    return rt;
};

float(entity head) IsTouchingTeleporter =
{
	local entity e;
	local vector center = head.origin;
	local float radius, side;

		// Get the biggest measure to create the biggest possible cube that contains the entity
	if(head.size_x >= head.size_y && head.size_x >= head.size_z)
		side = head.size_x;
	else if(head.size_y >= head.size_x && head.size_y >= head.size_z)
		side = head.size_y;
	else if(head.size_z >= head.size_x && head.size_z >= head.size_x)
		side = head.size_z;

	// The radius of a sphere that only touches the vertexes of a cube is half the cube's body diagonal
	// (The body diagonal of a cube whose sides equal x is "sqrt(3) * x")
	radius = (side * sqrt(3)) / 2;
	e = findradius(head.origin, radius);

	while(e)
	{
		if(e.classname == "trigger_teleport" && e.targetname)
		{
			return TRUE;
		}
		e = e.chain;
	}
	return FALSE;
};
