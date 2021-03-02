

/*  Modelo para verificacion formal, incluye especificacion LTL - ISEL 2021 */


/* FSM inputs (used for guards) */
int button;

/* FSM outputs */
int light;

/* FSM others */
int deadline = 1; 


/* FSM behavior */
active proctype fsm() {
    int state = 0;

    printf("0\n");
    do
    :: (state == 0)  -> atomic {
        if
        :: (button) -> light = 1; state = 1; button = 0; printf("0 -> 1\n");
        fi
    }
    :: (state == 1) -> atomic {
        if
        :: (button) -> button = 0; printf("1 -> 1\n");
        :: (deadline) -> state = 0; light = 0; deadline = 0; printf("1 -> 0\n");
        fi
    }
    od
}

/* Process that changes inputs */

active proctype env(){
    do
    ::  if
        :: button = 1;
        :: skip;
        fi
    od
}





