//Seven Languages in Seven Weeks
//Scala Day 2

/**
* Item 1
**/
println("Item 1: Use foldLeft to computer the total size of a list of Strings")
val strings = List("abc","123","youandmegirl")//3+3+12=18

//Start sum at 0, iterate over Strings, each item return the running sum
//Plus the size of this element
val totalStrLen = (0 /: strings) {(sum,item) => sum + item.size}
print(strings)
print("=>")
println(totalStrLen)

/**
* Item 2
**/
println()
println("Write a Censor trait with a  method that will replace the curse words Shoot and Darn with Plucky and Beans alteratives.  Use a map to stro the curse words and their alternatives")

trait Censor {
	val dirtyWords = Map("Shoot" ->"Plucky", "Darn"->"Beans")
	def cleanUp(dirty:String) = {
		//getOrElse(word,word) means use the value from the map if it exists, otherwise the word itself
		dirty.split(" ").toList.map(word => dirtyWords.getOrElse(word,word)).mkString(" ")
	}
}

object PrettyWords extends Object with Censor {
	def talk(toSay:String) = println(cleanUp(toSay))
}

PrettyWords.talk("Gosh Darn it, Shoot that hurt")


println("")
println("Now load the dirty words from a file instead of from the command line")

//Hrm. I seem to need to provide values here so the map can by typed, how else to do this?
var dirtyWords = scala.collection.mutable.Map(""->"")


//Load all the files from the source file and print them out.  I'm not tying it back to the Censor trait
//so I can split the exercise parts, but from here that should be reasonable.
scala.io.Source.fromFile("dirtyWords.txt").getLines.toList.foreach(line => dirtyWords(line.split(",").toList(0)) = line.split(",").toList(1))
println(dirtyWords)
