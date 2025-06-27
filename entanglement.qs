import Microsoft.Quantum.Intrinsic.*;
import Microsoft.Quantum.Canon.*;

//Put qubit in desired state.
operation SetQubitState(desired: Result, target: Qubit) : Unit {
	if desired != M(target) {    //M() measures the state of qubit (0 or 1)
                               //If it does not match 'desired, it runs X().
		X(target);  //Flips state of qubit so state probabilities are reversed. 
	}
}

//Test the Bell state/EPR pair. 
operation Main() : (Int, Int, Int, Int) {
    mutable numOnesQ1 = 0;
    mutable numOnesQ2 = 0;
    let count = 1000;
    let initial = One;
    
    use (q1, q2) = (Qubit(), Qubit());   // allocate the qubits
    for test in 1..count {
        SetQubitState(initial, q1);
        SetQubitState(Zero, q2);     
        
        let resultQ1 = M(q1);            // measure each qubit
        let resultQ2 = M(q2);           
        
        if resultQ1 == One {             // Count the number of 'Ones' returned:
            numOnesQ1 += 1;
        }
        if resultQ2 == One {
            numOnesQ2 += 1;
        }
    }
    
    SetQubitState(Zero, q1);             // reset the qubits 
    SetQubitState(Zero, q2);

    // Display the times that |0> is returned, and times that |1> is returned
    Message($"Q1 - Zeros: {count - numOnesQ1}");
    Message($"Q1 - Ones: {numOnesQ1}");
    Message($"Q2 - Zeros: {count - numOnesQ2}");
    Message($"Q2 - Ones: {numOnesQ2}");
    return (count - numOnesQ1, numOnesQ1, count - numOnesQ2, numOnesQ2 );
}

//Put qubit in superposition. 
for test in 1..count {
    use (q1, q2) = (Qubit(), Qubit());   
    for test in 1..count {
        SetQubitState(initial, q1);
        SetQubitState(Zero, q2);
        
        H(q1);                // Add the H operation after initialization and before measurement

        // measure each qubit
        let resultQ1 = M(q1);            
        let resultQ2 = M(q2); 

//Entangle two qubits. 
import Microsoft.Quantum.Intrinsic.*;
import Microsoft.Quantum.Canon.*;

    operation SetQubitState(desired : Result, target : Qubit) : Unit {
        if desired != M(target) {
            X(target);
        }
    }

operation Main() : (Int, Int, Int, Int) {
    mutable numOnesQ1 = 0;
    mutable numOnesQ2 = 0;
    let count = 1000;
    let initial = Zero;

    use (q1, q2) = (Qubit(), Qubit());   // allocate the qubits
    for test in 1..count {
        SetQubitState(initial, q1);
        SetQubitState(Zero, q2);
        H(q1);            
        CNOT(q1, q2);      // Add the CNOT operation after the H operation
        let resultQ1 = M(q1);       // measure each qubit     
        let resultQ2 = M(q2);           

        if resultQ1 == One {        // Count the number of 'Ones' returned:
            numOnesQ1 += 1;
        }
        if resultQ2 == One {
            numOnesQ2 += 1;
        }
    }

    SetQubitState(Zero, q1);          // reset the qubits   
    SetQubitState(Zero, q2);
    
    // Display the times that |0> is returned, and times that |1> is returned
    Message($"Q1 - Zeros: {count - numOnesQ1}");
    Message($"Q1 - Ones: {numOnesQ1}");
    Message($"Q2 - Zeros: {count - numOnesQ2}");
    Message($"Q2 - Ones: {numOnesQ2}");
    return (count - numOnesQ1, numOnesQ1, count - numOnesQ2, numOnesQ2 );

    }
