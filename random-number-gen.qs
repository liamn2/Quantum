import Microsoft.Quantum.Convert.*;
import Microsoft.Quantum.Math.*;

operation Main() : Int {
    let max = 100;
    Message($"Sampling a random number between 0 and {max}: ");
    return GenerateRandomNumberInRange(max);  // Generate random number in the 0..max range.
}

/// Generates a random number between 0 and `max`.
operation GenerateRandomNumberInRange(max : Int) : Int {
    mutable bits = [];                 //Determine number of bits needed to represent `max`.
    let nBits = BitSizeI(max);         // Store result as 'nBits'.
    for idxBit in 1..nBits {           //Generate `nBits` random bits
        bits += [GenerateRandomBit()];    
    }
    let sample = ResultArrayAsInt(bits);
    return sample > max ? GenerateRandomNumberInRange(max) | sample;
}

/// Generates a random bit.
operation GenerateRandomBit() : Result {
    use q = Qubit();   // Allocate a qubit.
    H(q);              //Set the qubit into superposition of 0 and 1 (Hadamard gate).
                       // Hadamard gate takes a qubit and sets its value s.t. it has an equl probability
                       // of returning either 0 or 1 in the Bloch sphere. 
    let result = M(q); //Measure qubit and store as result below. 
    Reset(q);          //Reset to zero-state.
    return result;     // Return the result of the measurement.
    // Note that Qubit `q` is automatically released at the end of the block.
}
