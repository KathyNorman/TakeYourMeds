pragma solidity ^0.4.0;
contract TakeYourMeds {

    struct Med {
        string name;
        string instructions;
        string comments;
        uint8 interval;
        uint8 numberOfIntervals;
        uint8 currentInterval;
    }
    
    Med[] meds;
    address manager;
    address medTaker;

    constructor(uint8 _number, address _medTaker) public {
        manager = msg.sender;
        meds.length = _number;
        medTaker = _medTaker;
    }
    
    function registerMed(uint8 _medCount, 
                        string _name, 
                        string _instructions,
                        uint8 _interval,
                        uint8 _numberOfIntervals
                        ) public {
        
        if (msg.sender != manager) return;
        meds[_medCount].name = _name;
        meds[_medCount].instructions = _instructions;
        meds[_medCount].interval = _interval;
        meds[_medCount].numberOfIntervals = _numberOfIntervals;
        meds[_medCount].currentInterval = 0;
        
    }
    
    function TakeMed(uint8 _medNumber) public {
    
    if (msg.sender != medTaker) return;
    if (meds[_medNumber].currentInterval > meds[_medNumber].numberOfIntervals) return;
    //    meds[_medNumber].currentInterval = meds[_medNumber].currentInterval + 1;
        meds[_medNumber].currentInterval++;

    }


}
