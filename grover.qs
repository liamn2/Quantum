import Microsoft.Quantum.Convert.*;
import Microsoft.Quantum.Math.*;
import Microsoft.Quantum.Arrays.*;
import Microsoft.Quantum.Measurement.*;
import Microsoft.Quantum.Diagnostics.*;

operation Main() : Result[] {
    let nQubits = 5;
    let iterations = CalculateOptimalIterations(nQubits);
    Message($"Number of iterations: {iterations}");
    let results = GroverSearch(nQubits, iterations, ReflectAboutMarked);  // Use Grover's algorithm to find a particular marked state.
    return results;
}

operation GroverSearch(
    nQubits : Int,
    iterations : Int,
    phaseOracle : Qubit[] => Unit) : Result[] {
    use qubits = Qubit[nQubits];
    PrepareUniform(qubits);

    for _ in 1..iterations {
        phaseOracle(qubits);
        ReflectAboutUniform(qubits);
    }
    return MResetEachZ(qubits);  // Measure and return the answer.
}

function CalculateOptimalIterations(nQubits : Int) : Int {
    if nQubits > 63 {
        fail "This sample supports at most 63 qubits.";
    }
    let nItems = 1 <<< nQubits; // 2^nQubits
    let angle = ArcSin(1. / Sqrt(IntAsDouble(nItems)));
    let iterations = Round(0.25 * PI() / angle - 0.5);
    return iterations;
}

operation ReflectAboutMarked(inputQubits : Qubit[]) : Unit {
    Message("Reflecting about marked state...");
    use outputQubit = Qubit();
    within {
        X(outputQubit);  // We initialize the outputQubit to (|0⟩ - |1⟩) / √2, so that toggling it results in a (-1) phase.
        H(outputQubit);
        
        for q in inputQubits[...2...] {  // Flip the outputQubit for marked states.
            X(q);
        }
    } apply {
        Controlled X(inputQubits, outputQubit);
    }
}


operation PrepareUniform(inputQubits : Qubit[]) : Unit is Adj + Ctl {
    for q in inputQubits {
        H(q);
    }
}


operation ReflectAboutAllOnes(inputQubits : Qubit[]) : Unit {
    Controlled Z(Most(inputQubits), Tail(inputQubits));
}

operation ReflectAboutUniform(inputQubits : Qubit[]) : Unit {
    within {
        Adjoint PrepareUniform(inputQubits);  // Transform the uniform superposition to all-zero.
        
        for q in inputQubits {  // Transform the all-zero state to all-ones
            X(q);
        }
    } apply {
        // Now that we've transformed the uniform superposition to the
        // all-ones state, reflect about the all-ones state, then let the
        // within/apply block transform us back.
        ReflectAboutAllOnes(inputQubits);
    }
}
