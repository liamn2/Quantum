namespace Superposition {
// Only one namespace per program. Defaults to file name. 
}

@EntryPoint() //Specifies the programs point of execution.
operation MeasureOneQubit() : Result { // operation sets our function. Code here palces the qubit in a superposition. 
    use q = Qubit();                   // the Result after our operation corresponds to the return type of the M operation. The measurement result is stored in a new variable that's defined using the let statement:
    H(q);          // Qubuts are allocated using the 'use' keyword and the Qubit() type. 
    let result = M(q);  //M equivalent to Measure([PauliZ], [qubit]).
    Reset(q);  //Qubits must be reset to avoid hardware issues. 
    return result;
}

operation SayHelloQ() : Unit {          //Here's a basic example that takes no parameters and expects no return value. The Unit value is equivalent to NULL in other languages
    Message("Hello quantum world!");
}

operation Main() {
    MeasureOneQubit(); //Main() is auto identified as @EntryPoint().
    SayHelloQ();
}

Microsoft.Quantum.Intrinsic.Message("Hello quantum world!");

// imports all functions and operations from the Microsoft.Quantum.Intrinsic namespace.
import Microsoft.Quantum.Intrinsic.*;
Message("Hello quantum world!");

// imports just the `Message` function from the Microsoft.Quantum.Intrinsic namespace.
import Microsoft.Quantum.Intrinsic.Message;
Message("Hello quantum world!");

// namespaces in the standard library may be imported using `Std` instead of `Microsoft.Quantum`. 
import Std.Intrinsic.*;
Message("Hello quantum world!");

//namespaces in Q# examples
Microsoft.Quantum.Intrinsic
Microsoft.Quantum.Measurement.*

//Pre-defined qubit parameters. Custom parameters can be set. 
{
    "qubitParams": {
        "name": "qubit_gate_ns_e3",
        "instructionSet": "GateBased",
        "oneQubitMeasurementTime": "100 ns",
        "oneQubitGateTime": "50 ns",
        "twoQubitGateTime": "50 ns",
        "tGateTime": "50 ns",
        "oneQubitMeasurementErrorRate": 1e-3,
        "oneQubitGateErrorRate": 1e-3,
        "twoQubitGateErrorRate": 1e-3,
        "tGateErrorRate": 1e-3
    }
}

{
    "qubitParams": {
        "name": "qubit_gate_ns_e4",
        "instructionSet": "GateBased",
        "oneQubitMeasurementTime": "100 ns",
        "oneQubitGateTime": "50 ns",
        "twoQubitGateTime": "50 ns",
        "tGateTime": "50 ns",
        "oneQubitMeasurementErrorRate": 1e-4,
        "oneQubitGateErrorRate": 1e-4,
        "twoQubitGateErrorRate": 1e-4,
        "tGateErrorRate": 1e-4
    }
}

{
    "qubitParams": {
        "name": "qubit_gate_us_e3",
        "instructionSet": "GateBased",
        "oneQubitMeasurementTime": "100 µs",
        "oneQubitGateTime": "100 µs",
        "twoQubitGateTime": "100 µs",
        "tGateTime": "100 µs",
        "oneQubitMeasurementErrorRate": 1e-3,
        "oneQubitGateErrorRate": 1e-3,
        "twoQubitGateErrorRate": 1e-3,
        "tGateErrorRate": 1e-6
    }
}

{
    "qubitParams": {
        "name": "qubit_gate_us_e4",
        "instructionSet": "GateBased",
        "oneQubitMeasurementTime": "100 µs",
        "oneQubitGateTime": "100 µs",
        "twoQubitGateTime": "100 µs",
        "tGateTime": "100 µs",
        "oneQubitMeasurementErrorRate": 1e-4,
        "oneQubitGateErrorRate": 1e-4,
        "twoQubitGateErrorRate": 1e-4,
        "tGateErrorRate": 1e-6
    }
}

{
    "qubitParams": {
        "name": "qubit_maj_ns_e4",
        "instructionSet": "Majorana",
        "oneQubitMeasurementTime": "100 ns",
        "twoQubitJointMeasurementTime": "100 ns",
        "tGateTime": "100 ns",
        "oneQubitMeasurementErrorRate": 1e-4,
        "twoQubitJointMeasurementErrorRate": 1e-4,
        "tGateErrorRate": 0.05
    }
}

{
    "qubitParams": {
        "name": "qubit_maj_ns_e6",
        "instructionSet": "Majorana",
        "oneQubitMeasurementTime": "100 ns",
        "twoQubitJointMeasurementTime": "100 ns",
        "tGateTime": "100 ns",
        "oneQubitMeasurementErrorRate": 1e-6,
        "twoQubitJointMeasurementErrorRate": 1e-6,
        "tGateErrorRate": 0.01
    }
}
