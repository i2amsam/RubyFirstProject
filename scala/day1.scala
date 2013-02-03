//Seven Languages in Seven Weeks
//Week 4 -- Scala
//Goal:  Write a program which determines the winner for a game of tick-tac-toe

//Call with the board as space-seperated arguments in row-order
//scala day1.scala r1c1 r1c2 r1c3 r2c1 r2c2 r2c3 r3c1 r3c2 r3c3

//Example scala day1.scala O X O - X - O X O
//X wins in this example because it has the center column


//This trait gives access to the game board for game pieces
trait HasGame {
	def getGame(position:Int) = args(position)
}

//A connector is a range of board locations which are "connected"
class Connectors(val set:Range) extends Object with HasGame {
	def winner(player:String):Boolean = {
		//println("Checking for a winner for" +set)
		set.filter { position => 
			getGame(position)!=player
		}.isEmpty
	}
}

//Rows
val r1 = new Connectors((0 to 2))
val r2 = new Connectors((3 to 5))
val r3 = new Connectors((6 to 8))

//Columns
val c1 = new Connectors((0 to 8) by 3)
val c2 = new Connectors((1 to 8) by 3)
val c3 = new Connectors((2 to 8) by 3)

//Diagonals
val d1 = new Connectors((0 to 8) by 4)
val d2 = new Connectors((2 to 7) by 2)

//Check out all possible connectors to see who is the winner
//Exit as soon as one is found
List(r1,r2,r3,c1,c2,c3,d1,d2).foreach { connector =>
	if(connector.winner("X")) {
		println("X wins!")
		sys.exit();
	} else if(connector.winner("O")) {
		println("O wins!");
		sys.exit();
	}	
}
println("No winner!")


