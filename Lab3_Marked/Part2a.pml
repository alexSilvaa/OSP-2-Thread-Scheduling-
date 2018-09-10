int forks [5] = { 0,0,0,0,0 }	// 0 = availble and 1,2,3,4,5 is owners
bool PhilosopherAte [5] = { 0,0,0,0,0 }  //1 = Ate before once
bool PhilosopherThought [5] = { 0,0,0,0,0 }  //1 = Thought after eating
bool PhilosopherState [5] = { 0,0,0,0,0 } //1 = eating and 0 = thinking


    proctype Philosopher(int seat, left, right) 
    {
        int forkLeft = left; 
        int forkRight = right; 
        
        do 
        //:: if
        //   :: (PhilosopherState[seat - 1] == 1) -> PhilosopherState[seat - 1] = 0;
        //    forks[forkLeft] = 0; 
        //    forks[forkRight] = 0;
        //    PhilosopherThought[seat - 1] = 1;
        //   :: else goto Here
        //   fi
        
         :: if 
            :: (forks[forkLeft] == 0 && seat == 1) -> forks[forkLeft] = seat;
               printf("Here now l"); 
            :: (forks[forkLeft] == 0 && forks[forkRight] == seat) -> forks[forkLeft] = seat; 
            fi
        :: if 
            :: (forks[forkRight] == 0 && seat != 1) -> forks[forkRight] = seat;
               printf("Here now r");
            :: (forks[forkRight] == 0 && forks[forkLeft] == seat) -> forks[forkRight] = seat;  
            fi
        :: if 
            :: (forks[forkLeft] == seat && forks[forkRight] == seat);
                PhilosopherState[seat - 1] = 1; 
                PhilosopherAte[seat - 1] = 1;
                forks[forkLeft] = 0; 
                forks[forkRight] = 0;
                PhilosopherState[seat - 1] = 0; 
                printf("I Ate %d ", seat);  
            fi
        od
                     
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
        
          run Philosopher(1, 0, 4);
          run Philosopher(2, 1, 0);
          run Philosopher(3, 2, 1); 
          run Philosopher(4, 3, 2);
          run Philosopher(5, 4, 3);

          PhilosopherAte[0] == 1 -> printf("Philosopher 0 Ate");
          PhilosopherAte[1] == 1 -> printf("Philosopher 1 Ate");
          PhilosopherAte[2] == 1 -> printf("Philosopher 2 Ate");
          PhilosopherAte[3] == 1 -> printf("Philosopher 3 Ate");
          PhilosopherAte[4] == 1 -> printf("Philosopher 4 Ate");

           //PhilosopherThought[0] == 1 -> printf("Philosopher 0 Thought");
           //PhilosopherThought[1] == 1 -> printf("Philosopher 1 Thought");
           //PhilosopherThought[2] == 1 -> printf("Philosopher 2 Thought");
           //PhilosopherThought[3] == 1 -> printf("Philosopher 3 Thought");
           //PhilosopherThought[4] == 1 -> printf("Philosopher 4 Thought");
        
        //od
    } 
