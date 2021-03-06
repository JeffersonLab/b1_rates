#include "niel_fun.h"

// IMPORTANT!!!!! OUTSIDE THE RANGE OF THE DATA, THE VALUE IS SET TO THE CLOSEST KNOWN VALUE 
//
// RANGES:
// NEUTRONS:  E = 1.025E-10 - 5.525E+03 MeV
// PROTONS:   E = 1.000E-03 - 9.000E+03 MeV
// PIONS:     E = 1.500E+01 - 9.005E+03 MeV 
// ELECTRONS: E = 3.000E-01 - 2.000E+02 MeV

// neutrons: 
// P.J. Griffin et al., SAND92-0094 (Sandia Natl. Lab.93), priv. comm. 1996: E = 1.025E-10 - 1.995E+01 MeV 
// A. Konobeyev, J. Nucl. Mater. 186 (1992) 117: E = 2.000E+01 - 8.000E+02 MeV 
// M. Huhtinen and P.A. Aarnio, NIM A 335 (1993) 580 and priv. comm.: E = 8.050E+02 - 8.995E+03 MeV 
// protons: 
// G.P. Summers et al., IEEE NS40 (1993) 1372: E = 1.000E-03 - 2.000E+02 MeV 
// M. Huhtinen and P.A. Aarnio, NIM A 335 (1993) 580 and priv. comm.: E = 1.500E+01 - 9.005E+03 MeV 
// pions: 
// M. Huhtinen and P.A. Aarnio, NIM A 335 (1993) 580 and priv. comm.: E = 1.500E+01 - 9.005E+03 MeV 
// electrons: 
// G.P. Summers et al., IEEE NS40 (1993) 1372: E = 3.000E-01 - 2.000E+02 MeV


// Main Reference
// A. Vasilescu (INPE Bucharest) and G. Lindstroem (University of Hamburg), 
// Displacement damage in silicon, on-line compilation
// http://sesam.desy.de/members/gunnar/Si-dfuncs.html


TNiel::TNiel(Char_t* FileName){
  cout << "Executing constructor" << endl;
 

  double p0, p1;

  cout << "Copying name " << endl;
  fInFile = TString( FileName );


  cout << "Opening file " << fInFile.Data() <<endl;
  ifstream inputfile;
  inputfile.open(fInFile.Data(), ifstream::in);
  if( !inputfile ) {
    cerr << "Error opening input stream" << endl;
    return;
  }              

  cout << "Reading files " << fInFile.Data() << endl; 

 
  int i=0;
  
  while( !inputfile.eof() ){
 
    inputfile >> p0 >> p1 ;

    E_nielfactor[i] = p0;
    nielfactor[i]   = p1;
    i=i+1;
  }
  inputfile.close();
  niel_N = i;
}


double TNiel::GetNielFactor(double EMeV){
  // input energy in MeV
  int j = niel_N;
  for (int i=0; i<niel_N;i++) {
    if (EMeV<E_nielfactor[i]) {
      j=i;
      break;
    }
  }
  double value;
  if (j>0 && j<niel_N) value = nielfactor[j-1] + (nielfactor[j]-nielfactor[j-1])/(E_nielfactor[j]-E_nielfactor[j-1])*(EMeV-E_nielfactor[j-1]);
  else if (j==0) value = nielfactor[0];
  else value = nielfactor[niel_N-1];
		
  return value;
}





