import Microsoft.Quantum.Diagnostics.*;
operation Main() : (Result, Result) {     // Your entanglement code goes between the curly brackets. 
  use (q1, q2) = (Qubit(), Qubit());      // Allocate two qubits, q1 and q2, in the 0 state.
  H(q1);                                  // Put q1 into an even superposition.
  CNOT(q1, q2);                           // Entangle q1 and q2, making q2 depend on q1.
  DumpMachine();                          // Show the entangled state of the qubits.
  let (m1, m2) = (M(q1), M(q2));          // Measure q1 and q2 and store the results in m1 and m2.
  Reset(q1);                              // Reset q1 and q2 to the 0 state.
  Reset(q2);
  return (m1, m2);                        // Return the measurement results.
}
