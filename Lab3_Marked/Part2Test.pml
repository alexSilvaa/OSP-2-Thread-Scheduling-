bool forks [5] = { 1,1,1,1,1 }
//bool PhilosopherSeat [5] = { 0,0,0,0,0 }  
bool PhilosopherState [5] = { 0,0,0,0,0 } 


    proctype Philosopher(int seat) 
    {
        int forkLeft = seat; 
        int forkRight = seat - 1; 
        if 
        :: (seat == 0) -> forkRight = 4; 
        fi
        
           if
           :: (PhilosopherState[seat] == 1) -> PhilosopherState[seat] = 0;
           :: forks[forkLeft] = 1; 
           :: forks[forkRight] = 1;
           fi
               
           else ->
            (forks[forkLeft] == 1 && forks[forkRight] == 1) -> PhilosopherState[seat] = 1;
            forks[forkLeft] = 0; 
            forks[forkRight] = 0;             
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

        run Philosopher(0); 
        //run Philosopher(1);
        //run Philosopher(2); 
        //run Philosopher(3);
        //run Philosopher(4);
    }   
