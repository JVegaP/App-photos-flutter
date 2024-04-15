/// Method that executes a function with a certain time delay
/// [timeDuration] : Value of time to execute function
/// [function] : function to execute
void functionDelay({
  required int timeDuration,
  required Function function
}) async {
  await Future.delayed( Duration(milliseconds: timeDuration),(){
    function();
  });
}