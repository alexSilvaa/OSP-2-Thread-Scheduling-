
int shared = 0;
int done = 0;

	proctype A()
	{	int tmp;
        int i = 0;
        for (i : 0 .. 1) {
	        tmp = shared; tmp = tmp+1; shared = tmp;
        }
        done = done+1;
	}

	proctype B()
	{	
        int i = 0;
        for (i : 0 .. 1) {
            shared = shared + 1;
        }
		done = done +1;
	}

	init
	{	
        run A(); 
        run B();
        done == 2;
        assert(shared == 4);
	}
