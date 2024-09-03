echo "Running tests..."
echo

output=$(./a.out)
expected_output="Final tape contents:A1111111B"

echo "**********************************"
echo  "TEST 1"
if [ $? -eq 0 ] ; then
  echo "Pass: Program exited zero"
else
  echo "Fail: Program did not exit zero"
  exit 1
fi
echo "**********************************"
echo "Test 2"
if [[ "$output" == *"$expected_output"* ]] ; then
  echo  "$expected_output"
else
  echo  -e "Fail \nExpected:\n$expected_output \nbut got:\n$output"
  echo "**********************************"
  exit 1
fi
echo "**********************************"
echo
echo "All tests passed."

exit 0
