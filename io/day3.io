"Io Day 3 Exercises" println

"Enhance the parsing of the XML script" println

Builder := Object clone
Builder depth ::= 0

Builder forward := method (
	prefix := ("   " repeated(self depth()))
	writeln(prefix,"<", call message name, ">")
	self setDepth (self depth + 1);
	call message arguments foreach(
		arg,
		content := self doMessage(arg);
		if (content type == "Sequence", writeln(prefix,content)))
	self setDepth ( self depth -1)
	writeln(prefix,"</", call message name, ">"))

Builder ul(
		li("Lua"),
		li(b("Javascript")),
		li("Da bears")
	)
		
