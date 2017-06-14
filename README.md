# simHR
Modify signalGenScript to simulate a ventricular electrogram of a preferred heart rate. In sinus the simulated 
heart rate should be kept less than 87 beats per minute.
```
HR = 87;
[simSignal, AVD,VTD,TAD] = simulateSignal(min(87, HR),AWaveStruct,VWaveStruct,TWaveStruct,BaselineStruct,-1,-1,-1);
```
The simulated signal can be sped up or slowed down by changing the `newHR` value