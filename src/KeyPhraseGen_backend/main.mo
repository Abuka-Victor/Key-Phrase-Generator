import Random "mo:base/Random";
import Nat8 "mo:base/Nat8";
import Int8 "mo:base/Int8";
import Float "mo:base/Float";
import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";


actor KeyPhrase{

  let seed1: [Text] = ["tree", "carrot", "way", "meaning", "add", "mistreat", "discreet", "bird", "reach", "space", "indulge", "broccoli", "late", "captivate", "infinite", "food", "island", "share", "mask", "incident", "eye", "kill", "film", "dribble"];
  let seed2: [Text] = ["describe","safari","visual","crew","color","vein","tree","brother","fight","achieve", "function", "permission", "invisible", "equinox", "number", "seek", "cooperative", "slab", "symbol", "coach", "flock", "dictionary", "bracket", "consensus"];
  let seed3: [Text] = ["fail", "slave", "fit", "feminist", "halt", "flood", "effective", "minimize", "restaurant", "digress","carriage","spin", "official", "muscle", "tray", "respect", "choose", "leadership", "force", "fly", "water", "piece", "practical", "composer"];

let bufferSeed1 = Buffer.fromArray<Text>(seed1);
let bufferSeed2 = Buffer.fromArray<Text>(seed2);
let bufferSeed3 = Buffer.fromArray<Text>(seed3);
let result = Buffer.Buffer<Text>(0);
let keeper = Buffer.Buffer<[Text]>(0);


public func generateSeedPhrases() : async [Text] {
  result.clear();
  var usedNumbers = Buffer.Buffer<Nat>(0);
  var number: Nat = 0;
  for (numb in Iter.range(1, 4)) {
    // Generate random number
  let random = Random.Finite(await Random.blob());
  let randomByte = random.byte();
  let randomByteValue : Nat8 = switch randomByte {
  case null 0;
  case (?Nat8) Nat8;
};
var randomFloat = Float.fromInt(Int8.toInt(Int8.fromNat8(randomByteValue))) / 255.0;
if (randomFloat < 0){
  randomFloat *= -1;
};
let randomNumber = Float.floor(randomFloat * 24);
number := Nat8.toNat(Int8.toNat8(Int8.fromInt(Float.toInt(randomNumber))));

while(Buffer.contains<Nat>(usedNumbers, number, Nat.equal)){
  let random = Random.Finite(await Random.blob());
  let randomByte = random.byte();
  let randomByteValue : Nat8 = switch randomByte {
  case null 0;
  case (?Nat8) Nat8;
};
var randomFloat = Float.fromInt(Int8.toInt(Int8.fromNat8(randomByteValue))) / 255.0;
if (randomFloat < 0){
  randomFloat *= -1;
};
let randomNumber = Float.floor(randomFloat * 24);
number := Nat8.toNat(Int8.toNat8(Int8.fromInt(Float.toInt(randomNumber))));
};


// Add the word to the result buffer
result.add(bufferSeed1.get(number));
usedNumbers.add(number);
};
usedNumbers.clear();

  for (numb in Iter.range(1, 4)) {
    // Generate random number
  let random = Random.Finite(await Random.blob());
  let randomByte = random.byte();
  let randomByteValue : Nat8 = switch randomByte {
  case null 0;
  case (?Nat8) Nat8;
};
var randomFloat = Float.fromInt(Int8.toInt(Int8.fromNat8(randomByteValue))) / 255.0;
if (randomFloat < 0){
  randomFloat *= -1;
};
let randomNumber = Float.floor(randomFloat * 24);
number := Nat8.toNat(Int8.toNat8(Int8.fromInt(Float.toInt(randomNumber))));

while(Buffer.contains<Nat>(usedNumbers, number, Nat.equal)){
  let random = Random.Finite(await Random.blob());
  let randomByte = random.byte();
  let randomByteValue : Nat8 = switch randomByte {
  case null 0;
  case (?Nat8) Nat8;
};
var randomFloat = Float.fromInt(Int8.toInt(Int8.fromNat8(randomByteValue))) / 255.0;
if (randomFloat < 0){
  randomFloat *= -1;
};
let randomNumber = Float.floor(randomFloat * 24);
number := Nat8.toNat(Int8.toNat8(Int8.fromInt(Float.toInt(randomNumber))));
};


// Add the word to the result buffer
result.add(bufferSeed2.get(number));
usedNumbers.add(number);
};
usedNumbers.clear();

  for (numb in Iter.range(1, 4)) {
    // Generate random number
  let random = Random.Finite(await Random.blob());
  let randomByte = random.byte();
  let randomByteValue : Nat8 = switch randomByte {
  case null 0;
  case (?Nat8) Nat8;
};
var randomFloat = Float.fromInt(Int8.toInt(Int8.fromNat8(randomByteValue))) / 255.0;
if (randomFloat < 0){
  randomFloat *= -1;
};
let randomNumber = Float.floor(randomFloat * 24);
number := Nat8.toNat(Int8.toNat8(Int8.fromInt(Float.toInt(randomNumber))));

while(Buffer.contains<Nat>(usedNumbers, number, Nat.equal)){
  let random = Random.Finite(await Random.blob());
  let randomByte = random.byte();
  let randomByteValue : Nat8 = switch randomByte {
  case null 0;
  case (?Nat8) Nat8;
};
var randomFloat = Float.fromInt(Int8.toInt(Int8.fromNat8(randomByteValue))) / 255.0;
if (randomFloat < 0){
  randomFloat *= -1;
};
let randomNumber = Float.floor(randomFloat * 24);
number := Nat8.toNat(Int8.toNat8(Int8.fromInt(Float.toInt(randomNumber))));
};


// Add the word to the result buffer
result.add(bufferSeed3.get(number));
usedNumbers.add(number);
};
usedNumbers.clear();
number := 0;
keeper.add(Buffer.toArray<Text>(result));
return Buffer.toArray<Text>(result);
};

public query func getSeedPhrases(): async [[Text]] {
  return Buffer.toArray<[Text]>(keeper);
};

public query func clearSeedPhrases(): async Text {
  keeper.clear();
  return "Seed phrase bank is now empty";
};

public query func getNumberOfSeedPhrases(): async Nat {
  return keeper.size()
};
};
