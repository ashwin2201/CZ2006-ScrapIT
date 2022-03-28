Future retrievePoints() async{
  var ref = await databaseReference.collection("points").get();
  print(ref);
  return ref.docs;

}