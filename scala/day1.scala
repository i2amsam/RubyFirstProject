//Seven Languages in Seven Weeks
//Week 4 -- Scala
//Goal:  Write a program which determines the winner for a game of tick-tac-toe

//This trait gives access to the game board for game pieces
trait HasGame {
	def getGame(postion:Int) = "O"
}

//A connector is a range of board locations which are "connected"
class Connectors(val set:Range) extends Object with HasGame {
	def winner(player:String):Boolean = {
		println("Checking for a winner for" +set)
		set.filter { position => 
			getGame(position)!=player
		}.isEmpty
	}
}

//Rows
val r1 = new Connectors((0 until 3))
val r2 = new Connectors((4 until 6))
val r3 = new Connectors((7 until 9))

//Columns
val c1 = new Connectors((0 until 9) by 3)
val c2 = new Connectors((1 until 9) by 3)
val c3 = new Connectors((2 until 9) by 3)

//Diagonals
val d1 = new Connectors((0 until 9) by 4)
val d2 = new Connectors((2 until 8) by 2)

//Check out all possible connectors to see who is the winner
List(r1,r2,r3,c1,c2,c3,d1,d2).foreach { connector =>
	println(connector.winner("X"))
}



