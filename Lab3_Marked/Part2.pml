int forks [5] = { 0,0,0,0,0 }	// 0 = availble and 1,2,3,4,5 is owners
//bool PhilosopherSeat [5] = { 0,0,0,0,0 }  
bool PhilosopherState [5] = { 0,0,0,0,0 } //1 = eating and 0 = thinking


    proctype Philosopher(int seat, left, right) 
    {
        int forkLeft = left; 
        int forkRight = right; 
        
        
        if
        :: (PhilosopherState[seat - 1] == 1) -> PhilosopherState[seat - 1] = 0;
		:: forks[forkLeft] = 0; 
        :: forks[forkRight] = 0;
        fi
        //else ->
         if 
           :: (forks[forkLeft] == 0) -> forks[forkLeft] = seat;
           :: printf("Here now l"); 
           fi
         if 
           :: (forks[forkRight] == 0) -> forks[forkRight] = seat;
           :: printf("Here now r"); 
           fi
         if 
           :: (forks[forkLeft] == seat)  
           :: (forks[forkRight] == seat) 
           :: PhilosopherState[seat - 1] = 1; 
           fi
        
                     
    }

    init {
        //bool needSeat = 0;
        //int seat = 0;  
        //do 
        //:: if 
        //   :: (PhilosopherSeat[seat] == 0) -> break;
        //   :: else seat++; 
        //:: fi
        //od 
		//do
           ::run Philosopher(1, 0, 4);
           ::run Philosopher(2, 1, 0);
           //run Philosopher(3, 2, 1); 
          //:: run Philosopher(4, 3, 2);
          //:: run Philosopher(5, 4, 3);
        //od
    }   
