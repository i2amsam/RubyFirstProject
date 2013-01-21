"Day two problems" println
"Fibonacci Problem With Recusion" println

fibCalc := Object clone

//NB: Does not account for the early part of the sequence, must have 1 and 1 be sent in)
fibCalc fib := method(
	curStep := call sender doMessage (call message arguments at(0)) //Step
	twoBack := call sender doMessage (call message arguments at(1)) //n-2
	oneBack := call sender doMessage (call message arguments at(2)) //n-1

	if ((curStep <= 2),oneBack println,fibCalc fib(curStep-1, oneBack,oneBack + twoBack))
	//curStep println
)

fibCalc fib(6,1,1)

"Divide by zero" println
"Before" println
(10/0) println
(4/3) println

Number oldDivide := Number getSlot("/")
Number / := method(quot,if(quot == 0,call target *(0),call target oldDivide(quot)))
"After" println
(10/0) println
(4/3) println

"Two Dimensional Sum" println
Summer := Object clone
Summer sum := method(array,
	array println
	total := 0
	array foreach(subArray, total = total + (subArray sum))	
);

Summer sum(list(list(1,2,3),list(3,4,5))) println

"Adding an averaged to list" println
List myAverage := method(call target sum / call target size)
list(1,3,3) myAverage println
//list() myAverage println //Nil does not support /
//list("one",2) myAverage println //Io Exception operation not valid on non-number encodings

"Two dimensional list" println
TwoDList := list clone;

TwoDList dim := method(rows,cols,
	rows println
	cols println
	myList := TwoDList clone
	for (row,0,rows-1,
		row := list()
		for (col,0,cols-1,
			row append(0)
		)
		myList append(row)
	)
)
TwoDList dim(3,4) println

TwoDList get := method(x,y,call target at(x) at(y))

TwoDList dim(3,4) get(1,1) println

TwoDList set := method(x,y,value,call target at(x) atPut(y,value))

TwoDList dim(3,4) set(1,1,3) println

"Writing to a file" println
aList := TwoDList clone
oldList := aList dim(2,2)
oldList set(1,1,4)
outputFile := File open("./matrixOutput.txt")
outputFile write (oldList serialized());
outputFile close
newList := doFile("./matrixOutput.txt")
newList println

"Guessing Game" println
Game := Object clone
Game setSecret := method ("Secret is set" println; call target secret := (Random value(99) + 1) floor())
Game doGuess := method (
	guess := File standardInput() readLine() asNumber();
	if (guess == secret,"Correct!" println,
		if (guess < secret,"too low" println,"too high" println);doGuess)
)
Game setSecret()
Game doGuess(-1)

